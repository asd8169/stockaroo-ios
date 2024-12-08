//
//  Scheme+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 6/22/24.
//

import ProjectDescription

public extension Scheme {
    
    /// 지정된 타겟과 이름으로 Scheme 생성
    /// - Parameters:
    ///   - target: ConfigurationName (debug 또는 release)
    ///   - name: 스킴 이름
    /// - Returns: 구성된 Scheme 객체
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme.scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
