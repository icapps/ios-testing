# Make sure that the pods don't get an extra scheme.
install! 'cocoapods', deterministic_uuids: false,
                      share_schemes_for_development_pods: false

# Support from iOS 11.
platform :ios, '11.0'

# We need to use frameworks because of Swift.
use_frameworks!

# Don't show the warnings from your Pods in Xcode.
inhibit_all_warnings!

##########################
### Application target ###
##########################

target 'Testing' do
  ################################
  ### Application target tests ###
  ################################

  target 'TestingTests' do
    inherit! :search_paths

    pod 'Quick',            '~> 1.2'
    pod 'Nimble',           '~> 7.0'
    pod 'Nimble-Snapshots', '~> 6.3'
    pod 'Mockingjay',       '~> 2.0'
  end
end

####################
### Post install ###
####################

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
end
