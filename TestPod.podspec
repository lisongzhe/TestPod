

Pod::Spec.new do |s|

  s.name         = "TestPod"
  s.version      = "1.0.0"
  s.summary      = "a net working tool "

  s.description  = <<-DESC
  a net working tool u can use
                   DESC

  s.homepage     = "https://github.com/lisongzhe/TestPod"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author             = { "李松哲" => "442413437@163.com" }

  
  s.platform     = :ios


  s.source       = { :git => "https://github.com/lisongzhe/TestPod.git", :tag => "1.0.0"}

  s.source_files  = "Test/Test/Tools/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  s.requires_arc = true
  s.ios.deployment_target = "7.0"


  s.frameworks   = 'UIKit'

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
