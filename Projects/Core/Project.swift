//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 6/22/24.
//


import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.CoreModule.Core.rawValue,
    targets: [
        .implements(
            modulePath: .core(.Core),
            dependencies: [
                .shared,
            ]
        )
    ]
)
