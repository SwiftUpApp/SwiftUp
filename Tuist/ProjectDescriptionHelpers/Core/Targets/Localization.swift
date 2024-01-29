import ProjectDescription

struct Localization: Module {
    let path: String
    
    var mainTarget: Target {
        FrameworkBuilder {
            $0.resources = ["\(path)/Resources/**"]
            $0.scripts = [
                .pre(
                    script: """
curl -o \(path)/Resources/Localization/en.lproj/Localizable.strings 'https://localebro.com/project/16297/autoexport/file/ios/en_US/22e40482-c12e-4a84-be48-c69943ef7a75'
curl -o \(path)/Resources/Localization/pl.lproj/Localizable.strings 'https://localebro.com/project/16297/autoexport/file/ios/pl/22e40482-c12e-4a84-be48-c69943ef7a75'
""",
                    name: "Download localizable strings"
                )
            ]
        }
        .build(name: "Localization",
               destinations: Global.destinations,
               bundleID: Global.bundleID + ".localization",
               sources: ["\(path)/Sources/**"],
               deploymentTargets: Global.deploymentTarget)
    }
    
    var allTargets: [Target] {
        [mainTarget]
    }
}
