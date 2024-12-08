//
//  ProjectEnvironment.swift
//  EnvironmentPlugin
//
//  Created by  p2noo on 7/12/24.
//
import ProjectDescription
import Foundation

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let destinations: Destinations
    public let deploymentTargets: DeploymentTargets
    public let baseSetting: SettingsDictionary
    public let projectRoot: String
    
    public init(
        name: String,
        organizationName: String,
        destinations: Destinations,
        deploymentTargets: DeploymentTargets,
        baseSetting: SettingsDictionary = [:]
    ) {
        self.name = name
        self.organizationName = organizationName
        self.destinations = destinations
        self.deploymentTargets = deploymentTargets
        self.projectRoot = "\(FileManager.default.currentDirectoryPath)"
        self.baseSetting = baseSetting.merging(ProjectEnvironment.defaultSettings(projectRoot: self.projectRoot)) { $1 }
    }
    
    private static func defaultSettings(projectRoot: String) -> SettingsDictionary {
        let absolutePath = "\(projectRoot)/.build/tuist-derived"
        return [
            "OTHER_CFLAGS": "$(inherited) -fmodule-map-file=\(absolutePath)/FlexLayoutYoga/FlexLayoutYoga.modulemap -fmodule-map-file=\(absolutePath)/FlexLayoutYogaKit/FlexLayoutYogaKit.modulemap",
            "OTHER_SWIFT_FLAGS": "$(inherited) -Xcc -fmodule-map-file=\(absolutePath)/FlexLayoutYoga/FlexLayoutYoga.modulemap -Xcc -fmodule-map-file=\(absolutePath)/FlexLayoutYogaKit/FlexLayoutYogaKit.modulemap"
        ]
    }
}

public let env = ProjectEnvironment(
    name: "Sample",
    organizationName: "com.asd8169",
    destinations: [.iPhone, .iPad],
    deploymentTargets: .iOS("15.0")
)
