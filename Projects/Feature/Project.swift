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
    name: ModulePaths.FeatureModule.Feature.rawValue,
    resources: ["Resources/**"],
    targets: [
        .implements(
            modulePath: .feature(.Feature),
            dependencies: [
                .feature(implementation: .RootFeature),
            ]
        )
    ]
)
