import ProjectDescription
import ProjectDescriptionHelpers

let viewSwiftUINameAttribute: Template.Attribute = .required("name")

let viewSwiftUITemplate = Template(
    description: "",
    attributes: [
        viewSwiftUINameAttribute,
    ],
    items: [
        .file(
            path: "\(Global.mainFolderPath)/\(viewSwiftUINameAttribute)/Sources/\(viewSwiftUINameAttribute)View.swift",
            templatePath: "../stencils/view-swiftui.stencil"),
    ])
