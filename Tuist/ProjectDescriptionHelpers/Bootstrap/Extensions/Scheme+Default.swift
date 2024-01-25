import ProjectDescription

extension Scheme {
    public static func `default`(
        named name: String,
        buildTarget: Target,
        runConfiguration: Configuration,
        archiveConfiguration: Configuration) -> Scheme {
            Scheme(
                name: name,
                shared: true,
                buildAction: BuildAction(targets: ["\(buildTarget.name)"]),
                runAction: .runAction(configuration: runConfiguration.name),
                archiveAction: .archiveAction(configuration: archiveConfiguration.name)
            )
        }
}
