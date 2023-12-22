import ProjectDescription
import ProjectDescriptionHelpers

public let addResourcesNameAttribute: Template.Attribute = .required("name")

let addResourcesTemplate = Template(
    description: "Basic composable architecture feature template",
    attributes: [
        addResourcesNameAttribute,
    ],
    items: [
        .directory(
            path: "\(Global.mainFolderPath)/\(addResourcesNameAttribute)", 
            sourcePath: "../Common/Resources"),
    ])
