import SwiftUI

struct SurahView: View {
    let surahs = SurahDetail.allSurahs
    @State private var searchText = ""
    
    var filteredSurahs: [SurahDetail] {
        if searchText.isEmpty {
            return surahs
        }
        return surahs.filter { 
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.arabicName.contains(searchText) ||
            $0.themes.contains { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(filteredSurahs) { surah in
                        NavigationLink(destination: SurahDetailView(surah: surah)) {
                            SurahCard(surah: surah)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Sourates")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .searchable(text: $searchText, prompt: "Rechercher une sourate...")
        }
    }
}

struct SurahCard: View {
    let surah: SurahDetail
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("EmeraldGreen").opacity(0.1))
                    .frame(width: 50, height: 50)
                
                Text("\(surah.id)")
                    .font(.headline)
                    .foregroundColor(Color("EmeraldGreen"))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(surah.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(surah.arabicName)
                        .font(.amiri(size: 20))
                        .foregroundColor(Color("EmeraldGreen"))
                }
                
                Text(surah.summary)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack(spacing: 8) {
                    Label("\(surah.versesCount) versets", systemImage: "text.bubble")
                    Spacer()
                    Text(surah.revelation)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(surah.revelation == "Mecquoise" ? Color("Gold").opacity(0.2) : Color("EmeraldGreen").opacity(0.2))
                        .foregroundColor(surah.revelation == "Mecquoise" ? Color("Gold") : Color("EmeraldGreen"))
                        .cornerRadius(4)
                }
                .font(.caption2)
                .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}

struct SurahDetailView: View {
    let surah: SurahDetail
    @State private var showFullContent = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerCard
                contextCard
                messageCard
                themesCard
                keyVersesSection
                applicationCard
            }
            .padding()
        }
        .navigationTitle(surah.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
    
    private var headerCard: some View {
        VStack(spacing: 16) {
            Text(surah.arabicName)
                .font(.amiri(size: 48))
                .foregroundColor(Color("EmeraldGreen"))
            
            Text(surah.name)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack(spacing: 24) {
                VStack {
                    Text("\(surah.versesCount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("EmeraldGreen"))
                    Text("Versets")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                VStack {
                    Text(surah.revelation == "Mecquoise" ? "🕌" : "🏘️")
                        .font(.title)
                    Text(surah.revelation)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text(surah.summary)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var contextCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "book.pages")
                    .foregroundColor(Color("Gold"))
                Text("Contexte de la révélation")
                    .font(.headline)
            }
            
            Text(surah.context)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var messageCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "message.fill")
                    .foregroundColor(Color("EmeraldGreen"))
                Text("Message de la sourate")
                    .font(.headline)
            }
            
            Text(surah.message)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var themesCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "tag.fill")
                    .foregroundColor(.orange)
                Text("Thèmes principaux")
                    .font(.headline)
            }
            
            FlowLayout(spacing: 8) {
                ForEach(surah.themes, id: \.self) { theme in
                    Text(theme)
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color("EmeraldGreen").opacity(0.1))
                        .foregroundColor(Color("EmeraldGreen"))
                        .cornerRadius(16)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var keyVersesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "quote.opening")
                    .foregroundColor(Color("Gold"))
                Text("Versets clés")
                    .font(.headline)
            }
            
            ForEach(surah.keyVerses, id: \.verse) { keyVerse in
                KeyVerseCard(keyVerse: keyVerse)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var applicationCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Application dans la vie")
                    .font(.headline)
            }
            
            Text(surah.application)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}

struct KeyVerseCard: View {
    let keyVerse: KeyVerse
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Text(keyVerse.verse)
                .arabicText()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Gold").opacity(0.1))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(keyVerse.transliteration)
                    .font(.body)
                    .italic()
                    .foregroundColor(.secondary)
                
                Text(keyVerse.translation)
                    .font(.body)
                    .fontWeight(.medium)
                
                Divider()
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("EmeraldGreen"))
                        .padding(.top, 2)
                    
                    Text(keyVerse.explanation)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.5))
        .cornerRadius(12)
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                       y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if currentX + size.width > maxWidth, currentX > 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: currentX, y: currentY))
                currentX += size.width + spacing
                lineHeight = max(lineHeight, size.height)
            }
            
            self.size = CGSize(width: maxWidth, height: currentY + lineHeight)
        }
    }
}

#Preview {
    SurahView()
}
