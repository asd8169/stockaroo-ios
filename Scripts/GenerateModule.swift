#!/usr/bin/swift
import Foundation

// MARK: - Enums

/// 레이어 타입 정의
enum LayerType: String {
    case feature = "Feature"
    case domain = "Domain"
    case core = "Core"
    case shared = "Shared"
    case userInterface = "UserInterface"
}

// MARK: - Data Structures

/// 모듈 이름,타겟여부 변수 초기화
struct ModuleInfo {
    let moduleName: String
    let hasInterface: Bool
    let hasTesting: Bool
    let hasTests: Bool
    let hasExample: Bool
    let author: String
    let currentDate: String
}

// MARK: - Signal Handling

/// SIGINT(Interrupt) 시그널을 처리하여 프로그램을 정상적으로 종료하는 함수
func handleSIGINT(_ signal: Int32) {
    exit(0) // 정상 종료
}

// SIGINT 시그널 핸들러 등록
signal(SIGINT, handleSIGINT)

// MARK: - Main Logic

let bash = Bash() // Bash 객체 생성

// 레이어 입력받는 함수
let layer = promptLayer()

// 모듈 이름,타겟여부 변수 초기화
var moduleName: String = ""
var hasInterface: Bool = false
var hasTesting: Bool = false
var hasTests: Bool = false
var hasExample: Bool = false
let author: String = getUserName()
let currentDate: String = getCurrentDate()

repeat {
    let moduleInfo = makeModuleInfo()
    moduleName = moduleInfo.moduleName
    hasInterface = moduleInfo.hasInterface
    hasTesting = moduleInfo.hasTesting
    hasTests = moduleInfo.hasTests
    hasExample = moduleInfo.hasExample
} while checkModuleInfo()

registerModuleDependency()
print("✅ Module is created successfully!")

// MARK: - Input Functions

/// 모듈 정보를 입력받아 ModuleInfo 구조체로 반환하는 함수
/// - Returns: ModuleInfo 구조체
func makeModuleInfo() -> ModuleInfo {
    let moduleName = promptInput("Enter module name")
    print("moduleName ::: \(moduleName)")
    let hasInterface = promptInput("This module has a 'Interface' Target? (y\\n, default = n)") == "y"
    let hasTesting = promptInput("This module has a 'Testing' Target? (y\\n, default = n)").lowercased() == "y"
    let hasTests = promptInput("This module has a 'Tests' Target? (y\\n, default = n)").lowercased() == "y"
    let hasExample = promptInput("This module has a 'Example' Target? (y\\n, default = n)").lowercased() == "y"
    
    return ModuleInfo(
        moduleName: moduleName,
        hasInterface: hasInterface,
        hasTesting: hasTesting,
        hasTests: hasTests,
        hasExample: hasExample,
        author: author,
        currentDate: currentDate
    )
}

/// 모듈 정보가 올바른지 사용자에게 확인하는 함수
/// - Returns: Bool 값 (true, false)
func checkModuleInfo() -> Bool {
    print("------------------------------------------------------------------------------------------------------------------------")
    print("Is this the correct module information you are generating? (y\\n, default = y)")
    print("Layer: \(layer.rawValue)")
    print("Module name: \(moduleName)")
    print("interface: \(hasInterface), testing: \(hasTesting), tests: \(hasTests), example: \(hasExample)")
    print("Author: \(author), Date: \(currentDate)")
    print("------------------------------------------------------------------------------------------------------------------------")
    
    let checkInput = promptInput("")
    return checkInput.lowercased() != "y"
}

/// 사용자에게 입력을 요청하는 메시지를 출력하고 값을 반환하는 함수
/// - Parameter message: 사용자에게 출력할 메시지
/// - Returns: 사용자가 입력한 문자열
func promptInput(_ message: String) -> String {
    print("\(message)", terminator: " : ")
    guard let input = readLine(), !input.isEmpty else {
        return "n"
    }
    return input
}

/// 현재 날짜를 "M/d/yy" 형식으로 반환하는 함수
/// - Returns: 현재 날짜 문자열
func getCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yy"
    return dateFormatter.string(from: Date())
}

/// 시스템의 사용자명을 반환하는 함수
/// - Returns: 사용자명 문자열
func getUserName() -> String {
    return ProcessInfo.processInfo.environment["USER"] ?? "Unknown"
}

/// 사용자로부터 레이어 이름을 입력받고 유효한 레이어 타입을 반환하는 함수
/// - Returns: LayerType 값
func promptLayer() -> LayerType {
    while true {
        print("Enter layer name\n(Feature | Domain | Core | Shared | UserInterface)", terminator: " : ")
        if let layerInput = readLine(),
           let layer = LayerType(rawValue: layerInput) {
            return layer
        } else {
            print("Invalid layer. Please enter a valid layer name.")
        }
    }
}

// MARK: - Module Dependency Registration

/// 모듈 의존성을 등록하는 함수
func registerModuleDependency() {
    registerModulePaths()
    makeModuleScaffold()
}

/// 모듈 스캐폴드를 생성 함수
func makeModuleScaffold() {
    let commonArguments: [String] = [
        "--name", "\(moduleName)",
        "--layer", "\(layer.rawValue)",
        "--author", "\(author)",
        "--current-date", "\(currentDate)"
    ]
    
    let moduleArguments: [String] = commonArguments + [
        "--has-interface", "\(hasInterface)",
        "--has-testing", "\(hasTesting)",
        "--has-tests", "\(hasTests)",
        "--has-example", "\(hasExample)"
    ]
    
    executeScaffold(for: "Module", with: moduleArguments)
    
    if hasInterface {
        executeScaffold(for: "Interface", with: commonArguments)
    }
    
    if hasTesting {
        executeScaffold(for: "Testing", with: commonArguments)
    }
    
    if hasTests {
        executeScaffold(for: "Tests", with: commonArguments)
    }
    
    if hasExample {
        executeScaffold(for: "Example", with: commonArguments)
    }
}

/// 주어진 타겟에 대해 tuist scaffold 명령을 실행하는 함수
/// - Parameters:
///   - target: 스캐폴드를 생성할 타겟 이름
///   - arguments: 스캐폴드 명령어에 전달할 인자 배열
func executeScaffold(for target: String, with arguments: [String]) {
    do {
        let result = try bash.run(
            commandName: "tuist",
            arguments: ["scaffold", target] + arguments
        )
        print("Scaffold command output for \(target): \(result)")
    } catch {
        print("❌ Failed to run scaffold command for \(target): \(error)")
    }
}

// MARK: - File Operations

let fileManager = FileManager.default
let currentPath = "./"

/// ModulePaths.swift에 모듈을 등록하는 함수
func registerModulePaths() {
    let filePath = currentPath + "Plugin/DependencyPlugin/ProjectDescriptionHelpers/ModulePaths.swift"
    if !isModuleAlreadyRegistered(filePath: filePath, moduleName: moduleName) {
        updateFileContent(
            filePath: filePath,
            finding: "enum \(layer.rawValue)Module: String, CaseIterable {\n",
            inserting: "        case \(moduleName)\n"
        )
        print("Register \(layer.rawValue) Layer's \(moduleName) to ModulePaths.swift")
    } else {
        print("Module \(moduleName) is already registered in \(layer.rawValue)Module")
    }
}

/// 주어진 파일 경로에 모듈이 이미 등록되어 있는지 확인하는 함수
/// - Parameters:
///   - filePath: 확인할 파일 경로
///   - moduleName: 확인할 모듈 이름
/// - Returns: Bool 값 (true: 이미 등록됨, false: 등록되지 않음)
func isModuleAlreadyRegistered(filePath: String, moduleName: String) -> Bool {
    guard let fileContent = try? String(contentsOfFile: filePath) else {
        return false
    }
    return fileContent.contains("case \(moduleName)")
}

/// 파일에 내용을 업데이트하는 함수
/// - Parameters:
///   - filePath: 업데이트할 파일 경로
///   - findingString: 찾을 문자열
///   - insertString: 찾은 문자열 다음에 삽입할 문자열
func updateFileContent(
    filePath: String,
    finding findingString: String,
    inserting insertString: String
) {
    let fileURL = URL(fileURLWithPath: filePath)
    guard let readHandle = try? FileHandle(forReadingFrom: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    guard let readData = try? readHandle.readToEnd() else {
        fatalError("❌ Failed to find \(filePath)")
    }
    try? readHandle.close()
    
    guard var fileString = String(data: readData, encoding: .utf8) else { fatalError() }
    fileString.insert(contentsOf: insertString, at: fileString.range(of: findingString)?.upperBound ?? fileString.endIndex)
    
    guard let writeHandle = try? FileHandle(forWritingTo: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    writeHandle.seek(toFileOffset: 0)
    try? writeHandle.write(contentsOf: Data(fileString.utf8))
    try? writeHandle.close()
}

// MARK: - Bash Handler

protocol CommandExecuting {
    func run(commandName: String, arguments: [String]) throws -> String
}

enum BashError: Error {
    case commandNotFound(name: String)
}

struct Bash: CommandExecuting {
    
    /// 주어진 명령어와 인자로 Bash 명령어를 실행하는 함수
    /// - Parameters:
    ///   - commandName: 실행할 명령어 이름
    ///   - arguments: 명령어에 전달할 인자 배열
    /// - Returns: 명령어 실행 결과 문자열
    /// - Throws: BashError 또는 Process 관련 오류
    func run(commandName: String, arguments: [String] = []) throws -> String {
        return try run(resolve(commandName), with: arguments)
    }
    
    /// 주어진 명령어 이름을 풀 경로로 변환하는 함수
    /// - Parameter command: 변환할 명령어 이름
    /// - Returns: 명령어의 풀 경로 문자열
    /// - Throws: BashError.commandNotFound
    private func resolve(_ command: String) throws -> String {
        guard var bashCommand = try? run("/bin/bash", with: ["-l", "-c", "which \(command)"]) else {
            throw BashError.commandNotFound(name: command)
        }
        bashCommand = bashCommand.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return bashCommand
    }
    
    /// 주어진 명령어와 인자로 프로세스를 실행하는 함수
    /// - Parameters:
    ///   - command: 실행할 명령어 경로
    ///   - arguments: 명령어에 전달할 인자 배열
    /// - Returns: 명령어 실행 결과 문자열
    private func run(_ command: String, with arguments: [String] = []) throws -> String {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        return String(decoding: outputData, as: UTF8.self)
    }
}
