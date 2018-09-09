# source 'https://github.com/CocoaPods/Specs.git' 
platform :ios, '9.0' 
use_frameworks!

target 'Mart' do
	pod 'Alamofire', '~> 4.4'
	pod 'SwiftyJSON', '~> 3.1'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.1'
        end
    end
end
