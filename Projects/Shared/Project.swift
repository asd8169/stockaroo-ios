//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.SharedModule.Shared.rawValue,
    targets: [
        .implements(
            modulePath: .shared(.Shared),
            dependencies: [
                .shared(implementation: .ThirdPartyLibrary),
                .shared(implementation: .CommonUI),
            ]
        ),
    ]
)

