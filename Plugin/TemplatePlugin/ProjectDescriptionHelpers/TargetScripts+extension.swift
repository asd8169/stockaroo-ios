//
//  TargetScripts+extension.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 6/25/24.
//

import ProjectDescription

public extension TargetScript {
    
    static let swiftLintRunScript = TargetScript.pre(
        path: .relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLintShell"
    )
    
}
