//
//  RootFeatrue.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.FeatureModule.RootFeature.rawValue,
    targets: [
        .implements(
            modulePath: .feature(.RootFeature),
            dependencies: [
                .feature(interface: .RootFeature),
            ]
        ),
        .interface(
            modulePath: .feature(.RootFeature),
            dependencies: [
                .domain
            ]
        ),
        .testing(
            modulePath: .feature(.RootFeature),
            dependencies: [
                .feature(interface: .RootFeature)
            ]
        ),
        .tests(
            modulePath: .feature(.RootFeature),
            dependencies: [
                .feature(implementation: .RootFeature),
                .feature(testing: .RootFeature)
            ]
        ),
        .example(
            modulePath: .feature(.RootFeature),
            dependencies: [
                .feature(implementation: .RootFeature),
                .feature(testing: .RootFeature)
            ]
        )
    ]
)
