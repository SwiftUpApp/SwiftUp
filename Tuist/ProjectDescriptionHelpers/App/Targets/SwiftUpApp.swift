import Bootstrap
import ProjectDescription

struct SwiftUpApp: TargetConvertible {
    let path: String
    
    var properties: [String : InfoPlist.Value] {
        PlistPropertiesBuilder()
            .set(bundleName: "$(APP_NAME)")
            .set(bundleDisplayName: "$(APP_NAME)")
            .set(bundleIconName: "AppIcon")
            .set(doesUseNonExemptEncryption: false)
            .set(macOSMinimumVersion: "12.3")
            .set(supportedInterfaceOrientations: [.portrait])
            .set(version: "$(APP_VERSION)",
                 buildNumber: "$(APP_BUILD_NUMBER)")
            .build()
    }
    
    var target: Target {
        AppBuilder {
            $0.sources = [
                "\(path)/Sources/**",
            ]
            $0.resources = ["\(path)/Resources/**/*"]
            $0.dependencies = [
                Feature.splash.dependency,
                ThirdParty.composableArchitecture.dependency
            ]
            $0.settings = .settings(configurations: Configurations.allCases.map(\.configuration))
            $0.infoPlist = .extendingDefault(with: properties)
        }
            .build(name: "SwiftUp",
                   bundleID: Global.bundleID,
                   deploymentTarget: Global.deploymentTarget)
    }
}
