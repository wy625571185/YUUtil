#
# Be sure to run `pod lib lint YUTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YUTool'
  s.version          = '0.0.1'
  s.summary          = '测试pods 使用.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 测试pods 使用.
                       DESC

  s.homepage         = 'https://github.com/wy625571185/YUUtil'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yu' => '625571185@qq.com' }
  s.source           = { :git => 'https://github.com/wy625571185/YUUtil.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files = 'YUTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YUTool' => ['YUTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
  
  s.pod_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',  # 关键参数‌:ml-citation{ref="1" data="citationList"}
    'DEFINES_MODULE' => 'YES'  # 强制声明模块化‌:ml-citation{ref="5" data="citationList"}
  }
  
end
