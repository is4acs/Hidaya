import SwiftUI

struct ModuleDetailView: View {
    let module: Module
    @State private var completedLessons: Set<String> = []
    @AppStorage("completedLessonsData") private var completedLessonsData: Data = Data()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerView
                lessonsList
            }
            .padding()
        }
        .navigationTitle(module.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { loadProgress() }
    }
    
    private var headerView: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color("EmeraldGreen").opacity(0.12))
                    .frame(width: 80, height: 80)
                
                Image(systemName: module.iconName)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(Color("EmeraldGreen"))
            }
            
            Text(module.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            progressSection
        }
        .padding(20)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(16)
    }
    
    private var progressSection: some View {
        VStack(spacing: 8) {
            let progress = CGFloat(completedLessons.count) / CGFloat(max(module.lessons.count, 1))
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 6)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("EmeraldGreen"))
                        .frame(width: geometry.size.width * progress, height: 6)
                        .animation(.spring(response: 0.4), value: progress)
                }
            }
            .frame(height: 6)
            
            Text("\(completedLessons.count) / \(module.lessons.count) leçons")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
    
    private var lessonsList: some View {
        VStack(spacing: 10) {
            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                NavigationLink(destination: LessonView(
                    lesson: lesson,
                    lessonNumber: index + 1,
                    isCompleted: completedLessons.contains(lesson.id),
                    onComplete: { markComplete(lesson.id) }
                )) {
                    LessonRow(lesson: lesson, number: index + 1, isCompleted: completedLessons.contains(lesson.id))
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private func markComplete(_ lessonId: String) {
        completedLessons.insert(lessonId)
        saveProgress()
    }
    
    private func saveProgress() {
        if let data = try? JSONEncoder().encode(Array(completedLessons)) {
            completedLessonsData = data
        }
    }
    
    private func loadProgress() {
        if let decoded = try? JSONDecoder().decode([String].self, from: completedLessonsData) {
            completedLessons = Set(decoded)
        }
    }
}

struct LessonRow: View {
    let lesson: Lesson
    let number: Int
    let isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(isCompleted ? Color("EmeraldGreen") : Color.gray.opacity(0.15))
                    .frame(width: 34, height: 34)
                
                if isCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Text("\(number)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.secondary)
                }
            }
            
            Text(lesson.title)
                .font(.subheadline.weight(.medium))
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

struct LessonView: View {
    let lesson: Lesson
    let lessonNumber: Int
    let isCompleted: Bool
    let onComplete: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if !isCompleted {
                    completeButton
                }
                
                lessonContent
            }
            .padding()
        }
        .navigationTitle("Leçon \(lessonNumber)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var completeButton: some View {
        Button(action: onComplete) {
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 18))
                Text("Marquer comme terminée")
                    .font(.subheadline.weight(.semibold))
            }
            .foregroundColor(.white)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(Color("EmeraldGreen"))
            .cornerRadius(12)
        }
    }
    
    private var lessonContent: some View {
        VStack(spacing: 12) {
            ForEach(parseSections(), id: \.id) { section in
                SectionView(section: section)
            }
        }
    }
    
    private func parseSections() -> [ContentSection] {
        let blocks = lesson.content.components(separatedBy: "\n\n")
        return blocks.enumerated().compactMap { index, block in
            let trimmed = block.trimmingCharacters(in: .whitespaces)
            guard !trimmed.isEmpty else { return nil }
            return ContentSection(id: index, content: trimmed)
        }
    }
}

struct ContentSection: Identifiable {
    let id: Int
    let content: String
}

struct SectionView: View {
    let section: ContentSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(parseLines(), id: \.id) { line in
                LineView(lineItem: line)
            }
        }
        .padding(16)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
    
    private func parseLines() -> [LineItem] {
        let lines = section.content.components(separatedBy: "\n")
        return lines.enumerated().compactMap { index, text in
            let trimmed = text.trimmingCharacters(in: .whitespaces)
            guard !trimmed.isEmpty else { return nil }
            return LineItem(id: index, text: trimmed)
        }
    }
}

struct LineItem: Identifiable {
    let id: Int
    let text: String
}

struct LineView: View {
    let lineItem: LineItem
    
    var body: some View {
        let type = analyzeLine(lineItem.text)
        
        Group {
            switch type {
            case .title:
                TitleLine(text: cleanText(lineItem.text))
            case .subtitle:
                SubtitleLine(text: cleanText(lineItem.text))
            case .bullet:
                BulletLine(text: cleanText(lineItem.text, removePrefix: "- "))
            case .numbered:
                NumberedLine(text: cleanText(lineItem.text, removeNumberPrefix: true))
            case .emoji:
                EmojiLine(text: cleanText(lineItem.text))
            case .normal:
                NormalLine(text: cleanText(lineItem.text))
            }
        }
    }
    
    private enum LineType {
        case title, subtitle, bullet, numbered, emoji, normal
    }
    
    private func analyzeLine(_ text: String) -> LineType {
        if text.hasPrefix("**") && text.hasSuffix("**") && text.count > 4 {
            return .title
        }
        if text.hasPrefix("📋") || text.hasPrefix("💡") || text.hasPrefix("🎯") || text.hasPrefix("✅") {
            return .emoji
        }
        if text.hasSuffix(":") && text.count < 50 {
            return .subtitle
        }
        if text.hasPrefix("- ") {
            return .bullet
        }
        if isNumberedLine(text) {
            return .numbered
        }
        return .normal
    }
    
    private func isNumberedLine(_ text: String) -> Bool {
        let pattern = "^\\d+\\.\\s"
        return text.range(of: pattern, options: .regularExpression) != nil
    }
    
    private func cleanText(_ text: String, removePrefix: String? = nil, removeNumberPrefix: Bool = false) -> String {
        var result = text
            .replacingOccurrences(of: "**", with: "")
        
        if let prefix = removePrefix {
            result = result.replacingOccurrences(of: prefix, with: "", options: .anchored)
        }
        
        if removeNumberPrefix {
            if let range = result.range(of: "^\\d+\\.\\s", options: .regularExpression) {
                result.removeSubrange(range)
            }
        }
        
        return result
    }
}

struct TitleLine: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(Color("EmeraldGreen"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SubtitleLine: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BulletLine: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(Color("EmeraldGreen"))
                .frame(width: 6, height: 6)
                .padding(.top, 7)
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct NumberedLine: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("•")
                .font(.body.weight(.bold))
                .foregroundColor(Color("EmeraldGreen"))
                .frame(width: 16)
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct EmojiLine: View {
    let text: String
    
    var body: some View {
        let (emoji, cleanContent) = extractEmoji(text)
        
        HStack(alignment: .top, spacing: 10) {
            Text(emoji)
                .font(.body)
                .frame(width: 24)
            
            Text(cleanContent)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func extractEmoji(_ text: String) -> (String, String) {
        let emojis = ["📋", "💡", "🎯", "✅"]
        for emoji in emojis {
            if text.contains(emoji) {
                let clean = text.replacingOccurrences(of: emoji, with: "").trimmingCharacters(in: .whitespaces)
                return (emoji, clean)
            }
        }
        return ("", text)
    }
}

struct NormalLine: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        ModuleDetailView(module: Module.allModules[0])
    }
}
