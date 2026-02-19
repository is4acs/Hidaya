import SwiftUI

@MainActor
class ParcoursViewModel: ObservableObject {
    @AppStorage("completedModules") private var completedModulesData: Data = Data()
    @Published var completedModules: Set<String> = []
    @Published var modules = Module.allModules
    
    init() {
        loadProgress()
    }
    
    var progressPercentage: Double {
        Double(completedModules.count) / Double(modules.count)
    }
    
    func isCompleted(_ moduleId: String) -> Bool {
        completedModules.contains(moduleId)
    }
    
    func toggleCompletion(_ moduleId: String) {
        if completedModules.contains(moduleId) {
            completedModules.remove(moduleId)
        } else {
            completedModules.insert(moduleId)
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        saveProgress()
    }
    
    func resetProgress() {
        completedModules.removeAll()
        saveProgress()
    }
    
    private func saveProgress() {
        if let data = try? JSONEncoder().encode(Array(completedModules)) {
            completedModulesData = data
        }
    }
    
    private func loadProgress() {
        if let decoded = try? JSONDecoder().decode([String].self, from: completedModulesData) {
            completedModules = Set(decoded)
        }
    }
}
