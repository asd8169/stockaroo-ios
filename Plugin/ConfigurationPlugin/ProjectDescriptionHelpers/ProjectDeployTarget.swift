//
//  ProjectDeployTarget.swift
//  EnvironmentPlugin
//
//  Created by  p2noo on 6/26/24.
//

import ProjectDescription

public enum ProjectDeployTarget: String {
    case dev = "DEV"
    case prod = "PROD"
}

public extension ProjectDeployTarget {
    var configurationName: ConfigurationName {
        // 특정 이름에 해당하는 ConfigurationName을 만들어서 반환
        return ConfigurationName.configuration(self.rawValue)
    }
}

