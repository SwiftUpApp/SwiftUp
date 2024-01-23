import ProjectDescription

public enum Global {
    public static let bundleID = "$(BUNDLE_ID)"
    public static let deploymentTarget: DeploymentTargets = .init(iOS: "16.0")
    public static let destinations: Destinations = [.iPhone, .iPad, .macWithiPadDesign]
    
    public static let mainFolderPath = "Targets"
}
