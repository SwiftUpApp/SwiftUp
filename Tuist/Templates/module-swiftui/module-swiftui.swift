import ProjectDescription
import ProjectDescriptionHelpers

let moduleSwiftUINameAttribute: Template.Attribute = .required("name")

let moduleSwiftUITemplate = Template(
    description: "Basic composable architecture feature template",
    attributes: [
        moduleSwiftUINameAttribute,
    ],
    items: [
        .file(
            path: "\(Global.mainFolderPath)/Feature/\(moduleSwiftUINameAttribute)/Sources/\(moduleSwiftUINameAttribute)Feature.swift",
            templatePath: "../stencils/feature.stencil"),
        .file(
            path: "\(Global.mainFolderPath)/Feature/\(moduleSwiftUINameAttribute)/Sources/\(moduleSwiftUINameAttribute)View.swift",
            templatePath: "../stencils/view-swiftui.stencil")
    ])
