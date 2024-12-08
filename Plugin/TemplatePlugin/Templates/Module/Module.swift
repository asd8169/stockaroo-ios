//
//  Module.swift
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription

// scaffold 명령어 시 받을 인자.
private let nameAttribute = Template.Attribute.required("name")
private let layerAttribute = Template.Attribute.required("layer")
private let authorAttribute: Template.Attribute = .required("author")
private let currentDateAttribute: Template.Attribute = .required("currentDate")
private let hasInterfaceAttribute: Template.Attribute = .optional("hasInterface", default: "false")
private let hasTestingAttribute: Template.Attribute = .optional("hasTesting", default: "false")
private let hasTestsAttribute: Template.Attribute = .optional("hasTests", default: "false")
private let hasExampleAttribute: Template.Attribute = .optional("hasExample", default: "false")

private let template = Template(
    description: "A template for a new module",
    attributes: [
        layerAttribute,
        nameAttribute,
        authorAttribute,
        currentDateAttribute,
        hasInterfaceAttribute,
        hasTestingAttribute,
        hasTestsAttribute,
        hasExampleAttribute
    ],
    items: ModuleTemplate.allCases.map { $0.item }
)



enum ModuleTemplate: CaseIterable {
    case project
    case sources
    
    // 템플릿 내부에 추가 파일.
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: "Projects/\(layerAttribute)/\(nameAttribute)/Project.swift", templatePath: "Project.stencil")
        case .sources:
            return .file(path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/Sources.swift", templatePath: "Sources.stencil")
        }
    }
}


