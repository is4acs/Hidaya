import SwiftUI

struct DuasView: View {
    @State private var selectedCategory: DuaCategory = .morning
    @State private var tasbihCount: Int = 0
    @State private var tasbihPhase: Int = 0
    @State private var showScale: Bool = false
    
    private let tasbihTargets = [
        (name: "SubhanAllah", arabic: "سُبْحَانَ اللَّهِ", count: 33),
        (name: "Alhamdulillah", arabic: "الْحَمْدُ لِلَّهِ", count: 33),
        (name: "Allahu Akbar", arabic: "اللَّهُ أَكْبَرُ", count: 34)
    ]
    
    private var duas: [Dua] {
        switch selectedCategory {
        case .morning: return Dua.morningDuas
        case .evening: return Dua.eveningDuas
        case .meal: return Dua.mealDuas
        case .sleep: return Dua.sleepDuas
        case .travel: return Dua.travelDuas
        case .tasbih: return []
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    categoryPicker
                    
                    if selectedCategory == .tasbih {
                        tasbihView
                    } else {
                        duasListView
                    }
                }
                .padding()
            }
            .navigationTitle("Dou'as")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(DuaCategory.allCases, id: \.self) { category in
                    Button(action: {
                        withAnimation { selectedCategory = category }
                    }) {
                        Text(category.rawValue)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color("EmeraldGreen") : Color(.systemBackground))
                            .foregroundColor(selectedCategory == category ? .white : .primary)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal, 4)
        }
    }
    
    private var duasListView: some View {
        LazyVStack(spacing: 16) {
            ForEach(duas) { dua in
                DuaCard(dua: dua)
            }
        }
    }
    
    private var tasbihView: some View {
        VStack(spacing: 24) {
            Text(tasbihTargets[tasbihPhase].arabic)
                .arabicText()
                .padding()
                .background(Color("Gold").opacity(0.1))
                .cornerRadius(12)
            
            Text(tasbihTargets[tasbihPhase].name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("\(tasbihCount) / \(tasbihTargets[tasbihPhase].count)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0, to: Double(tasbihCount) / Double(tasbihTargets[tasbihPhase].count))
                    .stroke(Color("EmeraldGreen"), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                
                Text("\(tasbihCount)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(Color("EmeraldGreen"))
            }
            .scaleEffect(showScale ? 1.05 : 1.0)
            .animation(.spring(response: 0.2), value: showScale)
            
            Button(action: incrementTasbih) {
                Text("تسبيح")
                    .font(.amiri(size: 32))
                    .frame(width: 200, height: 60)
                    .background(Color("EmeraldGreen"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            
            Button("Réinitialiser") {
                withAnimation {
                    tasbihCount = 0
                    tasbihPhase = 0
                }
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private func incrementTasbih() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        withAnimation {
            showScale = true
            tasbihCount += 1
            
            if tasbihCount >= tasbihTargets[tasbihPhase].count {
                if tasbihPhase < tasbihTargets.count - 1 {
                    tasbihPhase += 1
                    tasbihCount = 0
                } else {
                    tasbihCount = 0
                    tasbihPhase = 0
                    let notification = UINotificationFeedbackGenerator()
                    notification.notificationOccurred(.success)
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            showScale = false
        }
    }
}

struct DuaCard: View {
    let dua: Dua
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            Text(dua.title)
                .font(.headline)
                .foregroundColor(Color("EmeraldGreen"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(dua.arabic)
                .arabicText()
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 8) {
                Text(dua.transliteration)
                    .font(.body)
                    .italic()
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                Text(dua.translation)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}

#Preview {
    DuasView()
}
