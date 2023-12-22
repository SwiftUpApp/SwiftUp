import ProjectDescription

public enum Global {
    public static let bundleID = "$(BUNDLE_ID)"
    public static let deploymentTarget: DeploymentTarget = .iOS(
        targetVersion: "16.0",
        devices: [.iphone, .ipad])
    public static let mainFolderPath = "Targets"
}
