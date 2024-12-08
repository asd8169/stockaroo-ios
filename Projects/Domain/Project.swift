//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.DomainModule.Domain.rawValue,
    targets: [
        .implements(
            modulePath: .domain(.Domain),
            dependencies: [
                .core
            ]
        )
    ]
)
