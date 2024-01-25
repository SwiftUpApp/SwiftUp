import ProjectDescription

struct SwiftUpApp {
    let path: String
    
    var properties: [String : Plist.Value] {
        PlistPropertiesBuilder()
            .set(bundleName: "$(APP_NAME)")
            .set(bundleDisplayName: "$(APP_NAME)")
            .set(bundleIconName: "AppIcon")
            .set(doesUseNonExemptEncryption: false)
            .set(macOSMinimumVersion: "12.3")
            .set(supportedInterfaceOrientations: [.portrait])
            .set(launchStoryboardName: "LaunchScreen")
            .set(version: "$(MARKETING_VERSION)",
                 buildNumber: "$(CURRENT_PROJECT_VERSION)")
            .build()
    }
    
    var target: Target {
        AppBuilder {
            $0.sources = [
                "\(path)/Sources/**",
            ]
            $0.resources = ["\(path)/Resources/**/*"]
            $0.featureDependencies = [
                .splash
            ]
            $0.thirdPartyDependencies = [
                .composableArchitecture
            ]
            $0.settings = .settings(configurations: Configurations.allCases.map(\.configuration))
            $0.infoPlist = .extendingDefault(with: properties)
        }
            .build(name: "SwiftUp",
                   destinations: Global.destinations,
                   bundleID: Global.bundleID,
                   deploymentTargets: Global.deploymentTarget)
    }
}
