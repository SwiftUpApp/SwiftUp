import ProjectDescription
import ProjectDescriptionHelpers
import Foundation

public let featureNameAttribute: Template.Attribute = .required("name")

let featureTemplate = Template(
    description: "Basic composable architecture feature template",
    attributes: [
        featureNameAttribute,
    ],
    items: [
        .file(
            path: "\(Global.mainFolderPath)/\(featureNameAttribute)/Sources/\(featureNameAttribute)Feature.swift",
            templatePath: .init(stringLiteral: "../stencils/feature.stencil"))
    ])
