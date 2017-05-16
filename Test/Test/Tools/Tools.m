//
//  Tools.m
//  xmxcy_iphone
//
//  Created by zhouyu on 14-10-9.
//  Copyright (c) 2014年 mxyc. All rights reserved.
//

#import "Tools.h"


@implementation Tools

/**
 *  @author zhouyu, 2016-01-05 16:01:23
 *
 *  解析超链接中的参数
 *
 *  @param url       网址
 *  @param paramName 参数名称
 *
 *  @return 参数值
 *
 *  @since v6.6.0
 */
+ (NSString *)parseValueFromURL:(NSString *)url paramName:(NSString *)paramName {
    if (![paramName hasSuffix:@"="]) {
        paramName = [NSString stringWithFormat:@"%@=", paramName];
    }
    NSString *value = nil;
    NSRange start = [url rangeOfString:paramName];
    if (start.location != NSNotFound) {
        unichar c = '?';
        if (start.location != 0) {
            c = [url characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#') {
            NSRange end = [[url substringFromIndex:start.location + start.length] rangeOfString:@"&"];
            NSUInteger offset = start.location + start.length;
            value = (end.location == NSNotFound ? [url substringFromIndex:offset] : [url substringWithRange:NSMakeRange(offset, end.location)]);
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return value;
}

/**
 *  获取应用版本号
 *
 *  @author zhouyu
 *
 *  @since v5.5
 *
 *  @return 应用版本号
 *  @修改历史
 *  修改版本    作者名     修改明细
 *
 */
+ (NSString *)appVersion {
    // version:CFBundleShortVersionString build:CFBundleVersion
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

/**
 *  将时间戳转换成时间字符串
 *
 *  @author zhouyu
 *
 *  @since v5.5
 *
 *  @param formatterType 时间样式
 *  @param timeStamp     时间戳
 *
 *  @return 格式化后的字符串
 *  @修改历史
 *  修改版本    作者名     修改明细
 *
 */
+ (NSString *)formatTimeStamp:(NSString *)formatterType timeStamp:(NSString *)timeStamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterType];// @"yyyy-MM-dd HH:mm:ss"
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]]];
}

/**
 *  @author zhouyu, 2016-01-26 16:01:31
 *
 *  高精度的加减乘除
 *
 *  @param originValueLeft 算术运算符左侧数字
 *  @param originValueRight 算术运算符右侧数字
 *  @param calucateType 算术运算方式
 *
 *  @return 高精度的数值对象
 *
 *  @since v6.6.1
 */
+ (NSDecimalNumber *)decimalNumberCalucate:(NSString *)originValueLeft originValueRight:(NSString *)originValueRight calucateType:(CalucateType)calucateType {
    // 保留2位小数
    NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                              scale:2
                                                                                   raiseOnExactness:NO
                                                                                    raiseOnOverflow:NO
                                                                                   raiseOnUnderflow:NO
                                                                                raiseOnDivideByZero:YES];
    NSDecimalNumber *decimalNumberLeft = [NSDecimalNumber decimalNumberWithString:originValueLeft];
    NSDecimalNumber *decimalNumberRight = [NSDecimalNumber decimalNumberWithString:originValueRight];
    NSDecimalNumber *resultNumber;
    switch (calucateType) {
            
        case Adding:// 加：+
            resultNumber = [decimalNumberLeft decimalNumberByAdding:decimalNumberRight withBehavior:behavior];
            break;
            
        case Subtracting:// 减：-
            resultNumber = [decimalNumberLeft decimalNumberBySubtracting:decimalNumberRight withBehavior:behavior];
            break;
            
        case Multiplying:// 乘：*
            resultNumber = [decimalNumberLeft decimalNumberByMultiplyingBy:decimalNumberRight withBehavior:behavior];
            break;
            
        case Dividing:// 除：/
            resultNumber = [decimalNumberLeft decimalNumberByDividingBy:decimalNumberRight withBehavior:behavior];
            break;
            
        default:
            break;
    }
    return resultNumber;
}

/**
 *
 *  给定总数、列数后，进行遍历，并返回列数和行数，以及角标所在总数的位置
 *
 *  @param sumCount   总数
 *  @param columCount 列数
 *  @param block      回调block
 *
 */
+ (void)getSumCount:(NSInteger)sumCount columCount:(NSInteger)columCount andBlock:(void(^)(NSInteger row, NSInteger colum, NSInteger index))block {
    NSInteger _row, _colum, _index;
    BOOL judgment;
    if (sumCount % columCount == 0) {
        _row = sumCount / columCount;
        judgment = NO;
    } else {
        _row = (sumCount / columCount) + 1;
        judgment = YES;
    }
    for (NSInteger j = 0; j < _row; j++) {
        _colum = ((j == _row - 1) && judgment) ? (sumCount % columCount) : columCount;
        for (int i=0; i<_colum; i++) {
            _index = j * columCount + i;
            block(i, j, _index);
        }
    }
}



/**
 *
 *  将nil过滤成@""
 *
 *  @param value 字符串
 *
 *  @return 过滤后的对象
 *
 */
+ (id)nilToEmpty:(id)value {
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        return @"";
    } else {
        return value;
    }
}



@end
