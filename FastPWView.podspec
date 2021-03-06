#
#  Be sure to run `pod spec lint FastPWView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

#
# Be sure to run `pod lib lint FastPWView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FastPWView'
  s.version          = '0.2.1'
  s.summary          = '간편한 PIN 번호 뷰(Easy PIN number View)'
  s.description      = '앱 PIN번호 기능을 간편하게 사용할 수 있는 PASSWORD View입니다. (This is the PASSWORD View that allows you to easily use the app PIN number function.) '

  s.homepage         = 'https://github.com/Lautner-kwangho/FastPWView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lautner-kwangho
' => 'wooree2716@khcu.ac.kr' }
  s.source           = { :git => 'https://github.com/Lautner-kwangho/FastPWView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/FastPWView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FastPWView' => ['FastPWView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
