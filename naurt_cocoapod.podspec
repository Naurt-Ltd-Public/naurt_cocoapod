Pod::Spec.new do |s|
    s.name         = "naurt_cocoapod"
    s.version      = "0.1.0"
    s.summary      = "Naurt's official cocoapod sdk"
    s.description  = "Naurt's official cocoapod sdk, wrapping the ios framework into a cocoapod for legacy systems"
    s.homepage     = "https://www.naurt.com"
    s.license      = 'Commercial'
    s.authors      = { 'NaurtNickS' => 'support@naurt.com' }
    s.source       = { :git => "https://github.com/Naurt-Ltd-Public/naurt_framework_distribution.git", :branch => 'main' }

    s.ios.deployment_target = '13.4'

    s.swift_version = "4.0"
    s.dependency 'Zip', '2.1.2'

    s.public_header_files = "naurt_framework.framework/Headers/*.h"
    s.source_files = "naurt_framework.framework/Headers/*.h"
    s.vendored_frameworks = "naurt_framework.framework"

    s.preserve_paths = "naurt_framework.framework/*"
    s.xcconfig = {
        'FRAMEWORK_SEARCH_PATH[sdk=iphoneos*]' => '$(inherited) "$(PODS_ROOT)/naurt_framework"',
        'OTHERCFLAGS[sdk=iphoneos*]' => '$(inherited) -iframework "$(PODS_ROOT)/naurt_framework"',
        'OTHER_LDFLAGS[sdk=iphoneos*]' => '$(inherited) -framework naurt_framework',
    }

    # Some light hackery to prevent ismulator builds, as Naurt does not support simulators at this time
    s.pod_target_xcconfig = { 
        'VALID_ARCHS' => 'arm64 armv7',
        'ONLY_ACTIVE_ARCH' => 'Yes',
        'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 x86_64 armv7'
    }
    s.user_target_xcconfig = { 
        'VALID_ARCHS' => 'arm64 armv7',
        'ONLY_ACTIVE_ARCH' => 'Yes',
        'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 x86_64 armv7'
    }

    # s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }

    # s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    # s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end