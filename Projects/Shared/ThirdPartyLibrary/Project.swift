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
    name: ModulePaths.SharedModule.ThirdPartyLibrary.rawValue,
    targets: [
        .implements(
            modulePath: .shared(.ThirdPartyLibrary),
            product: .framework,
            dependencies: [
                .SPM.FlexLayout,
                .SPM.PinLayout,
            ]
        )
    ]
)
