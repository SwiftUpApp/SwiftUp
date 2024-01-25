import ProjectDescription

struct TabsTests {
    let path: String
    
    var target: Target {
        .unitTests(
            of: Feature.tabs.target,
            destinations: .iOS,
            sources: "\(path)/**",
            thirdPartyDependencies: [.composableArchitecture])
    }
}
