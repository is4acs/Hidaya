import SwiftUI

@MainActor
class QuizViewModel: ObservableObject {
    @Published var currentQuestion: Int = 0
    @Published var score: Int = 0
    @Published var showResult: Bool = false
    @Published var selectedAnswer: Int?
    @Published var isAnswered: Bool = false
    
    var questions: [QuizQuestion] = []
    
    var currentQuestionData: QuizQuestion? {
        guard currentQuestion < questions.count else { return nil }
        return questions[currentQuestion]
    }
    
    var progress: Double {
        Double(currentQuestion + 1) / Double(questions.count)
    }
    
    func selectAnswer(_ index: Int) {
        guard !isAnswered, let question = currentQuestionData else { return }
        
        selectedAnswer = index
        isAnswered = true
        
        if index == question.correctAnswer {
            score += 1
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        } else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
    
    func nextQuestion() {
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
            selectedAnswer = nil
            isAnswered = false
        } else {
            showResult = true
        }
    }
    
    func reset() {
        currentQuestion = 0
        score = 0
        showResult = false
        selectedAnswer = nil
        isAnswered = false
    }
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: Int
}
