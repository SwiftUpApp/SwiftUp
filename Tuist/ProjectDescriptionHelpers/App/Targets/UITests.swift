import ProjectDescription

struct UITests {
    let path: String
    
    var mainTarget: Target {
        .uiTests(
            of: App.swiftUpApp.target,
            destinations: Global.destinations,
            sources: ["\(path)/UITests/**"])
    }
}
