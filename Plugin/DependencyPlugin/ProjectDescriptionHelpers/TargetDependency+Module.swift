//
//  TargetDependency+Module.swift
//  DependencyPlugin
//
//  Created by  p2noo on 7/17/24.
//

import ProjectDescription


// MARK: - Feature
extension TargetDependency {
    
    public static var feature: Self {
        
        return .project(target: ModulePaths.FeatureModule.Feature.rawValue, path: .relativeToRoot("Projects/Feature"))
    }
    
    private static func feature(target: String, moduleName: String) -> TargetDependency {
        return .project(target: target, path: .relativeToRoot("Projects/Feature/" + moduleName))
    }
    
    public static func feature(interface moduleName: ModulePaths.FeatureModule) -> TargetDependency {
        
        .feature(target: moduleName.rawValue + "Interface", moduleName: moduleName.rawValue)
    }
    
    public static func feature(implementation moduleName: ModulePaths.FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue, moduleName: moduleName.rawValue)
    }
    
    public static func feature(testing moduleName: ModulePaths.FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "Testing", moduleName: moduleName.rawValue)
    }   
    
    public static func feature(test moduleName: ModulePaths.FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "Test", moduleName: moduleName.rawValue)
    }
    
}


extension TargetDependency {
    // MARK: - Domain
    public static var domain: Self {
        return .project(target: ModulePaths.DomainModule.Domain.rawValue, path: .relativeToRoot("Projects/Domain"))
    }
    
    private static func domain(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Domain/" + moduleName))
    }
    
    public static func domain(interface moduleName: ModulePaths.DomainModule) -> TargetDependency {
        .domain(target: moduleName.rawValue + "Interface", moduleName: moduleName.rawValue)
    }
    
    public static func domain(implementation moduleName: ModulePaths.DomainModule) -> TargetDependency {
        .domain(target: moduleName.rawValue, moduleName: moduleName.rawValue)
    }
    
    public static func domain(testing moduleName: ModulePaths.DomainModule) -> TargetDependency {
        .domain(target: moduleName.rawValue + "Testing", moduleName: moduleName.rawValue)
    } 
    
    public static func domain(test moduleName: ModulePaths.DomainModule) -> TargetDependency {
        .domain(target: moduleName.rawValue + "Test", moduleName: moduleName.rawValue)
    }
}


extension TargetDependency {
    // MARK: - Core
    public static var core: Self {
        
        return .project(target: ModulePaths.CoreModule.Core.rawValue, path: .relativeToRoot("Projects/Core"))
    }
    
    private static func core(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Core/" + moduleName))
    }
    
    public static func core(interface moduleName: ModulePaths.CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue + "Interface", moduleName: moduleName.rawValue)
    }
    
    public static func core(implementation moduleName: ModulePaths.CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue, moduleName: moduleName.rawValue)
    }
    
    public static func core(testing moduleName: ModulePaths.CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue + "Testing", moduleName: moduleName.rawValue)
    }
    
    public static func core(test moduleName: ModulePaths.CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue + "Test", moduleName: moduleName.rawValue)
    }
    
  
}


extension TargetDependency {
    
    // MARK: - Shared
    public static var shared: Self {
      
        return .project(target: ModulePaths.SharedModule.Shared.rawValue, path: .relativeToRoot("Projects/Shared"))
    }

    private static func shared(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Shared/" + moduleName))
    }
    
    public static func shared(interface moduleName: ModulePaths.SharedModule) -> TargetDependency {
        .shared(target: moduleName.rawValue + "Interface", moduleName: moduleName.rawValue)
    }
    
    public static func shared(implementation moduleName: ModulePaths.SharedModule) -> TargetDependency {
        .shared(target: moduleName.rawValue, moduleName: moduleName.rawValue)
    }
    
    public static func shared(testing moduleName: ModulePaths.SharedModule) -> TargetDependency {
        .shared(target: moduleName.rawValue + "Testing", moduleName: moduleName.rawValue)
    }
    
    public static func shared(test moduleName: ModulePaths.SharedModule) -> TargetDependency {
        .shared(target: moduleName.rawValue + "Test", moduleName: moduleName.rawValue)
    }
    
}
