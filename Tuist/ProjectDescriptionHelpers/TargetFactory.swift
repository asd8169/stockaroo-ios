//
//  TargetFactory.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/12/24.
//

import ProjectDescription
import EnvironmentPlugin
import TemplatePlugin

public struct TargetFactory {
    
    public static func createTarget(
        name: String,
        destinations: Destinations = env.destinations,
        product: Product,
        organizationName: String = env.organizationName,
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = [],
        deploymentTargets: DeploymentTargets = env.deploymentTargets,
        infoPlist: InfoPlist =  .file(path: "Support/Info.plist"),
        scripts: [TargetScript] = [.swiftLintRunScript],
        baseSettings: SettingsDictionary = [:]
    ) -> Target {
        return Target.target(
            name: name,
            destinations: destinations,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: scripts,
            dependencies: dependencies,
            settings: .settings(
                base:  baseSettings,
                defaultSettings: .recommended
            )
        )
    }
    
    //    public static func createTestTarget(
    //        name: String,
    //        bundleId: String,
    //        dependencies: [TargetDependency] = [],
    //        deploymentTargets: DeploymentTargets? = .iOS("15.0")
    //    ) -> Target {
    //        return Target.target(
    //            name: "\(name)Tests",
    //            destinations: env.destinations,
    //            product: .unitTests,
    //            bundleId: bundleId,
    //            deploymentTargets: deploymentTargets,
    //            infoPlist: .default,
    //            sources: ["Tests/**"],
    //            dependencies: dependencies
    //        )
    //    }
}
