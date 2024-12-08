import ProjectDescription
import EnvironmentPlugin
import TemplatePlugin
import ConfigurationPlugin
/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    /// module 생성 method
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - destinations: platform 파라미터 제거 -> destinations 추가, target에서 지원되는 배포 대상 설정
    ///   - product: 모듈의 product type (framework, staticFramework 등)
    ///   - organizationName: organizationName
    ///   - packages: 외부 패키지 의존성
    ///   - infoPlist:  Info.plist 설정 (기본값: .default)
    ///   - sources: 소스 파일 목록 (기본값: ["Sources/**"])
    ///   - resources: 리소스 파일 목록 (기본값: nil)
    ///   - deploymentTargets: deploymentTarget
    ///   - schemes: <#schemes description#>
    ///   - targets: <#targets description#>
    ///   - resourceSynthesizers: <#resourceSynthesizers description#>
    /// - Returns: 구성된 Project 객체
    public static func makeModule(
        name: String,
        //        product: Product,
        organizationName: String = env.organizationName,
        deploymentTargets: DeploymentTargets? = .iOS("15.0"),
        infoPlist: InfoPlist = .default,
        resources: ResourceFileElements? = nil,
        schemes: [Scheme]? = nil,
        targets: [Target] = [],
        resourceSynthesizers: [ProjectDescription.ResourceSynthesizer] = .default,
        baseSettings: SettingsDictionary = [:]
    ) -> Project {
        
        // 기본 설정 정의
        let settings: Settings = .settings(
            base:  baseSettings,
            configurations: [
                .debug(
                    name: .dev,
                    xcconfig: .relativeToRoot("XCConfig/Dev.xcconfig")),
                .release(
                    name: .prod,
                    xcconfig: .relativeToRoot("XCConfig/Prod.xcconfig")
                )
            ],
            defaultSettings: .recommended
        )
        
        // 기본 Scheme
        let defaultSchemes: [Scheme] = [.makeScheme(target: .dev, name: name)]
        
        // Project 객체 반환
        return Project(
            name: name,
            organizationName: organizationName,
            settings: settings,
            targets: targets,
            schemes: schemes ?? defaultSchemes,
            resourceSynthesizers: resourceSynthesizers
        )
    }
    
}


