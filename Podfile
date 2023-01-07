ios_version = '16.2'

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ios_version
use_frameworks!
workspace 'modularized_app_a.xcworkspace'

def snapKitPod
  pod 'SnapKit', '~> 5.6.0'
end

target 'modularized_app_a' do
  project 'modularized_app_a.project'
  snapKitPod
end

target 'modularized_module_a' do
  project 'modularized_module_a/modularized_module_a.project'
  snapKitPod
end

target 'modularized_module_b' do
  project 'modularized_module_b/modularized_module_b.project'
  snapKitPod
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = ios_version
    end
  end
end
