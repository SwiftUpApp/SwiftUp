import Bootstrap
import ProjectDescription

struct UITests: TargetConvertible {
    let path: String
    
    var target: Target {
        .uiTests(
            of: App.swiftUpApp.target,
            sources: ["\(path)/UITests/**"])
    }
}
