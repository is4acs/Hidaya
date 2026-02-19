import SwiftUI

@MainActor
class WuduViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var isPracticeMode: Bool = false
    @Published var completedSteps: Set<Int> = []
    @Published var showCompletionMessage: Bool = false
    
    let steps = WuduStep.allSteps
    
    var currentStepData: WuduStep? {
        guard currentStep < steps.count else { return nil }
        return steps[currentStep]
    }
    
    var progress: Double {
        Double(currentStep + 1) / Double(steps.count)
    }
    
    var isLastStep: Bool {
        currentStep == steps.count - 1
    }
    
    var isFirstStep: Bool {
        currentStep == 0
    }
    
    func nextStep() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentStep < steps.count - 1 {
                completedSteps.insert(currentStep)
                currentStep += 1
            } else {
                completedSteps.insert(currentStep)
                showCompletionMessage = true
            }
        }
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func previousStep() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentStep > 0 {
                currentStep -= 1
            }
        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func goToStep(_ index: Int) {
        withAnimation(.easeInOut(duration: 0.3)) {
            currentStep = max(0, min(index, steps.count - 1))
        }
    }
    
    func reset() {
        withAnimation {
            currentStep = 0
            completedSteps.removeAll()
            showCompletionMessage = false
        }
    }
    
    func toggleMode() {
        withAnimation {
            isPracticeMode.toggle()
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
