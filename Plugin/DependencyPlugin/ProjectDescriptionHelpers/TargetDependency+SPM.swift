//
//  TargetDependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 6/24/24.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {
        public static let ComposableArchitecture = external(name: "ComposableArchitecture")
        public static let FlexLayout = external(name: "FlexLayout")
        public static let PinLayout = external(name: "PinLayout")
    }
}
