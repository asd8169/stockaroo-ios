//
//  ModulePaths.swift
//  DependencyPlugin
//
//  Created by  p2noo on 7/12/24.
//

public enum ModulePaths {
    case app(String = "Sample")
    case feature(FeatureModule)
    case domain(DomainModule)
    case core(CoreModule)
    case shared(SharedModule)
    
    public var moduleName: String {
        switch self {
        case .app(let name):
            return name
        case .feature(let module):
            return module.rawValue
        case .domain(let module):
            return module.rawValue
        case .core(let module):
            return module.rawValue
        case .shared(let module):
            return module.rawValue
        }
    }
}

public extension ModulePaths {
    
    enum FeatureModule: String, CaseIterable {
        case Feature
        case RootFeature
    }

}

public extension ModulePaths {
    enum DomainModule: String, CaseIterable {
        case Domain
        case Analytics
        case Auth
    }
}

public extension ModulePaths {
    enum CoreModule: String, CaseIterable {
        case Core
    }
}

public extension ModulePaths {
    enum SharedModule: String, CaseIterable {
        case Shared
        case ThirdPartyLibrary
        case CommonUI
    }
}

