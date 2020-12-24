#
# Be sure to run `pod lib lint TTMutableArray.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTMutableArray'
  s.version          = '1.0.0'
  s.summary          = 'A Mutable Array that can be observed.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  If you want to KVO the changes in the elements of the mutable array, you can use the observable TTMutableArray.
  Or you can use the category method to add observer to any NSMutableArray.
                       DESC

  s.homepage         = 'https://github.com/Zhangguiguang/TTMutableArray'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GG' => 'zhanggzgzhz@gmail.com' }
  s.source           = { :git => 'https://github.com/Zhangguiguang/TTMutableArray.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TTMutableArray/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
