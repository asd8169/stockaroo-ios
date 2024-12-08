//
//  Example.swift
//  EnvironmentPlugin
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription

// scaffold 명령어 시 받을 인자.
private let nameAttribute = Template.Attribute.required("name")
private let layerAttribute = Template.Attribute.required("layer")
private let authorAttribute: Template.Attribute = .required("author")
private let currentDateAttribute: Template.Attribute = .required("currentDate")

private let template = Template(
    description: "A template for a new module's Example target",
    attributes: [
        layerAttribute,
        nameAttribute,
        authorAttribute,
        currentDateAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Example/Sources/AppDelegate.swift",
            templatePath: "ExampleSources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Example/Resources/LaunchScreen.storyboard",
            templatePath: "ExampleResources.stencil"
        )
    ]
)
