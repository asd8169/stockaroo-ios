//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import EnvironmentPlugin
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.SharedModule.CommonUI.rawValue,
    resources: ["Resources/**"],
    targets: [
        .implements(
            modulePath: .shared(.CommonUI),
            dependencies: [
                .shared(implementation: .ThirdPartyLibrary)
            ],
            baseSettings: env.baseSetting
        ),
        .tests(
            modulePath: .shared(.CommonUI),
            dependencies: [
                .shared(implementation: .CommonUI),
                .shared(testing: .CommonUI)
            ]
        ),
        .testing(
            modulePath: .shared(.CommonUI)
        ),
        .example(
            modulePath: .shared(.CommonUI),
            dependencies: [
                .shared(implementation: .CommonUI),
                .shared(testing: .CommonUI)
            ]
        )
    ]
)

