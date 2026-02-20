import SwiftUI

@MainActor
class ParcoursViewModel: ObservableObject {
    @AppStorage("completedLessonsData") private var completedLessonsData: Data = Data()
    @Published var completedLessons: Set<String> = []
    @Published var modules = Module.allModules
    
    init() {
        loadProgress()
    }
    
    var completedModulesCount: Int {
        modules.filter { module in
            module.lessons.allSatisfy { completedLessons.contains($0.id) }
        }.count
    }

    var totalLessonsCount: Int {
        modules.reduce(0) { $0 + $1.lessons.count }
    }

    var completedLessonsCount: Int {
        let allLessonIds = Set(modules.flatMap(\.lessons).map(\.id))
        return completedLessons.intersection(allLessonIds).count
    }

    var progressPercentage: Double {
        guard totalLessonsCount > 0 else { return 0 }
        return Double(completedLessonsCount) / Double(totalLessonsCount)
    }
    
    func isCompleted(_ moduleId: String) -> Bool {
        guard let module = modules.first(where: { $0.id == moduleId }) else { return false }
        return module.lessons.allSatisfy { completedLessons.contains($0.id) }
    }

    func refreshProgress() {
        loadProgress()
    }

    func resetProgress() {
        completedLessons = []
        completedLessonsData = Data()
    }
    
    private func loadProgress() {
        if let decoded = try? JSONDecoder().decode([String].self, from: completedLessonsData) {
            completedLessons = Set(decoded)
        } else {
            completedLessons = []
        }
    }
}
