import ProjectDescription

let config = Config(
    compatibleXcodeVersions: .upToNextMajor("15.0"),
    plugins: [
        .local(path: .relativeToCurrentFile("Plugins/Bootstrap"))
    ]
)
