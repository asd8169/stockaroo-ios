//
//  SourceFilesList+Extension.swift
//  DependencyPlugin
//
//  Created by  p2noo on 7/18/24.
//

import ProjectDescription

public extension SourceFilesList {
    static let example: SourceFilesList = "Example/Sources/**"
    static let interface: SourceFilesList = "Interface/**"
    static let sources: SourceFilesList = "Sources/**"
    static let testing: SourceFilesList = "Testing/**"
    static let tests: SourceFilesList = "Tests/**"
}
