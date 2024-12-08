//
//  ConfigurationName+Extension.swift
//  ConfigurationPlugin
//
//  Created by  p2noo on 6/26/24.
//

import ProjectDescription

public extension ConfigurationName {
    static var dev: ConfigurationName {
        return ProjectDeployTarget.dev.configurationName
    }
    static var prod: ConfigurationName {
        return ProjectDeployTarget.prod.configurationName
    }
}
