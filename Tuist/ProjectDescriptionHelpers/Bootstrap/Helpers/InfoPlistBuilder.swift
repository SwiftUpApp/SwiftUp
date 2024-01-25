import ProjectDescription

public final class PlistPropertiesBuilder {
    public typealias Key = String
    private var properties: [Key: Plist.Value] = [:]
    
    public init() {}
    
    public func build() -> [Key: Plist.Value] {
        properties
    }
}

extension PlistPropertiesBuilder {
    public func set(bundleDisplayName: String) -> Self {
        properties["CFBundleDisplayName"] = .string(bundleDisplayName)
        return self
    }
    
    public func set(bundleIconName: String) -> Self {
        properties["CFBundleIconName"] = .string(bundleIconName)
        return self
    }
    
    public func set(bundleName: String) -> Self {
        properties["CFBundleName"] = .string(bundleName)
        return self
    }
    
    public func set(doesUseNonExemptEncryption: Bool) -> Self {
        properties["ITSAppUsesNonExemptEncryption"] = .boolean(doesUseNonExemptEncryption)
        return self
    }
    
    public func set(fonts: [String]) -> Self {
        properties["UIAppFonts"] = .array(
            fonts.map { Plist.Value.string($0) }
        )
        return self
    }
    
    public func set(launchStoryboardName: String) -> Self {
        properties["UILaunchStoryboardName"] = .string(launchStoryboardName)
        return self
    }
    
    /// recommended value: "12.3"
    public func set(macOSMinimumVersion: String) -> Self {
        properties["LSMinimumSystemVersion"] = .string(macOSMinimumVersion)
        return self
    }
    
    public func set(isStatusBarHidden: Bool) -> Self {
        properties["UIStatusBarHidden"] = .boolean(isStatusBarHidden)
        return self
    }
    
    public func set(supportedInterfaceOrientations: [InterfaceOrientations]) -> Self {
        properties["UISupportedInterfaceOrientations"] = .array(supportedInterfaceOrientations.map(\.plistValue))
        return self
    }
    
    public func set(version: String, buildNumber: String) -> Self {
        properties["CFBundleShortVersionString"] = .string(version)
        properties["CFBundleVersion"] = .string(buildNumber)
        return self
    }
}

extension PlistPropertiesBuilder {
    public enum InterfaceOrientations {
        case portrait
        case upsideDown
        case landscapeLeft
        case landscapeRight
        
        var plistValue: Plist.Value {
            switch self {
            case .portrait:
                return "UIInterfaceOrientationPortrait"
            case .upsideDown:
                return "UIInterfaceOrientationPortraitUpsideDown"
            case .landscapeLeft:
                return "UIInterfaceOrientationLandscapeLeft"
            case .landscapeRight:
                return "UIInterfaceOrientationLandscapeRight"
            }
        }
    }
}
