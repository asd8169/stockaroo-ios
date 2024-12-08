//
//  Target+MicroFeatures.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/16/24.
//

import Foundation
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin


// MARK: - Implements
extension Target {
    
    public static func implements(modulePath: ModulePaths, product: Product = .staticLibrary , infoPlist: InfoPlist = .default, resources: ResourceFileElements = [], dependencies: [TargetDependency] = [], baseSettings: SettingsDictionary = [:]) -> Target {
        
        return TargetFactory.createTarget(
            name: modulePath.moduleName,
            product: product,
            sources: .sources,
            resources: resources,
            dependencies: dependencies,
            infoPlist: infoPlist,
            baseSettings: baseSettings
        )
    }
}

// MARK: - Interface
extension Target {
    
    public static func interface(modulePath: ModulePaths, infoPlist: InfoPlist = .default, dependencies: [TargetDependency] = []) -> Target {
        
        return TargetFactory.createTarget(
            name: modulePath.moduleName + "Interface",
            product: .staticLibrary,
            sources: .interface,
            dependencies: dependencies,
            infoPlist: infoPlist
        )
    }
}

// MARK: - Testing
extension Target {
    
    public static func testing(modulePath: ModulePaths, product: Product = .staticFramework, infoPlist: InfoPlist = .default, dependencies: [TargetDependency] = []) -> Target {
        
        return TargetFactory.createTarget(
            name: modulePath.moduleName + "Testing",
            product: .staticLibrary,
            sources: .testing,
            dependencies: dependencies,
            infoPlist: infoPlist
        )
    }
}

// MARK: - tests
extension Target {
    
    public static func tests(modulePath: ModulePaths, infoPlist: InfoPlist = .default, dependencies: [TargetDependency] = []) -> Target {
        
        return TargetFactory.createTarget(
            name: modulePath.moduleName + "Test",
            product: .unitTests,
            sources: .tests,
            dependencies: dependencies,
            infoPlist: infoPlist
        )
    }
}

// MARK: - Example
extension Target {
    
    public static func example(modulePath: ModulePaths, infoPlist: InfoPlist = .default, dependencies: [TargetDependency] = []) -> Target {
        
        return TargetFactory.createTarget(
            name: modulePath.moduleName + "Example",
            product: .app,
            sources: .example,
            dependencies: dependencies,
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ])
        )
    }
}
