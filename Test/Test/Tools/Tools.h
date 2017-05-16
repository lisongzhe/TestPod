//
//  Tools.h
//  xmxcy_iphone
//
//  Created by zhouyu on 14-10-9.
//  Copyright (c) 2014年 mxyc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    Adding,// 加
    Subtracting,// 减
    Multiplying,// 乘
    Dividing,// 除
} CalucateType;

@interface Tools : NSObject

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
+ (NSString *)parseValueFromURL:(NSString *)url paramName:(NSString *)paramName;

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
+ (NSString *)appVersion;

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
+ (NSString *)formatTimeStamp:(NSString *)formatterType timeStamp:(NSString *)timeStamp;

/**
 *  @author JyHu, 15-07-08 16:07:20
 *
 *  添加相册访问权限设置
 *
 *  @return 是否具有相册或者相机的访问权限
 *
 *  @since v6.3.0
 */
+ (BOOL)canInterviewImagesetsOrCamera;

/**
 *  @author JyHu, 15-12-01 13:12:13
 *
 *  @brief  在每次弹窗之前都必须隐藏键盘，否则会出现有弹窗的情况下还能输入内容
 *
 *  @since v6.3.5
 */
+ (void)hideKeyboard;

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
+ (NSDecimalNumber *)decimalNumberCalucate:(NSString *)originValueLeft originValueRight:(NSString *)originValueRight calucateType:(CalucateType)calucateType;



/**
 *  @author zhouyu, 2016-03-11 17:03:36
 *
 *  获取IDFA
 *
 *  @return IDFA
 *
 *  @since v6.6.2
 */
+ (NSString *)idfa;

/**
 *
 *  获取运营商
 *
 */
+ (NSString *)deviceCarrierName;

/**
 *
 *  手机型号
 *
 */
+ (NSString *)deviceMachineName;

/**
 *
 *  屏幕分辨率
 *
 */
+ (NSString *)deviceScreen;

/**
 *
 *  系统版本号
 *
 */
+ (NSString *)deviceOSVersion;


/**
 *  @author lisongzhe, 2016-4-18 12:05:58
 *
 *  @return 获取手机型号
 *
 *  @since v6.6.3
 */

+ (NSString *)deviceDetailType;


//判断当前机器是否越狱
+(NSString *)getIsJailBroken;



@end
