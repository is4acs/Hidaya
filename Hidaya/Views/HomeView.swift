import SwiftUI

struct HomeView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("streak") private var streak: Int = 0
    @AppStorage("lastOpenDate") private var lastOpenDate: Double = 0
    @AppStorage("completedLessonsData") private var completedLessonsData: Data = Data()
    
    @StateObject private var viewModel = HomeViewModel()
    
    private let quotes = [
        "Le Prophète ﷺ a dit: « La prière est la lumière de celui qui prie. »",
        "« En vérité, c'est dans le rappel d'Allah que les cœurs trouvent la paix. » - Coran 13:28",
        "« Allah est Beau et Il aime la beauté. » - Hadith",
        "« Les meilleures œuvres auprès d'Allah sont les plus régulières, même si elles sont peu. » - Hadith"
    ]
    
    @State private var currentQuote: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    greetingCard
                    
                    if viewModel.isRamadan {
                        ramadanCard
                    }
                    
                    prayerTimesCard
                    progressCard
                    quickActionsCard
                    dailyQuoteCard
                }
                .padding()
            }
            .navigationTitle("Hidaya هداية")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("EmeraldGreen"))
                    }
                }
            }
            .onAppear {
                updateStreak()
                currentQuote = quotes.randomElement() ?? quotes[0]
                viewModel.refreshData()
            }
        }
    }
    
    private var greetingCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("MandalaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text(PrayerTimeHelper.getGreeting())
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if !userName.isEmpty {
                        Text(userName)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("🔥 \(streak)")
                        .font(.title2)
                    Text("jours")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            if !viewModel.cityName.isEmpty {
                HStack {
                    Image(systemName: "location.fill")
                        .font(.caption)
                        .foregroundColor(Color("EmeraldGreen"))
                    Text(viewModel.cityName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var ramadanCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "moon.fill")
                    .foregroundColor(Color("Gold"))
                    .font(.title2)
                Text("Ramadan Kareem 🌙")
                    .font(.headline)
                    .foregroundColor(Color("Gold"))
                Spacer()
                Text(viewModel.ramadanDayText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 12) {
                HStack {
                    Text(viewModel.ramadanCountdownTitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                Text(viewModel.timeUntilFtour)
                    .font(.system(size: 48, weight: .bold, design: .monospaced))
                    .foregroundColor(Color("EmeraldGreen"))
                
                ProgressView(value: viewModel.ramadanProgress)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color("Gold")))
                
                HStack {
                    Image(systemName: "calendar")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Fin du Ramadan: \(formatRamadanEndDate())")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color("Gold").opacity(0.1))
            .cornerRadius(12)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("Gold").opacity(0.3), lineWidth: 2)
        )
    }
    
    private var prayerTimesCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(Color("EmeraldGreen"))
                Text("Horaires de prière")
                    .font(.headline)
                Spacer()
                if viewModel.isLoadingPrayers {
                    ProgressView()
                        .scaleEffect(0.7)
                } else {
                    Text(formatDate(Date()))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            ForEach(viewModel.prayers, id: \.name) { prayer in
                HStack {
                    Text(prayer.arabicName)
                        .font(.amiri(size: 18))
                    
                    Text(prayer.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(PrayerTime.formatTime(prayer.time))
                        .fontWeight(prayer.isNext ? .bold : .regular)
                        .foregroundColor(prayer.isNext ? Color("EmeraldGreen") : .primary)
                    
                    if prayer.isNext {
                        Image(systemName: "bell.fill")
                            .foregroundColor(Color("Gold"))
                            .font(.caption)
                    }
                }
                .padding(.vertical, 4)
                .padding(.horizontal, prayer.isNext ? 12 : 0)
                .background(prayer.isNext ? Color("EmeraldGreen").opacity(0.1) : Color.clear)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var progressCard: some View {
        let progress = overallProgress
        let progressPercent = Int(progress * 100)

        return VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(Color("EmeraldGreen"))
                Text("Ta progression")
                    .font(.headline)
            }
            
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: Color("EmeraldGreen")))
            
            Text("\(progressPercent)% du parcours débutant complété")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var quickActionsCard: some View {
        HStack(spacing: 12) {
            NavigationLink(destination: WuduGuideView()) {
                VStack {
                    Image(systemName: "drop.fill")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Wudu")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("EmeraldGreen"))
                .cornerRadius(12)
            }
            
            NavigationLink(destination: DuasView()) {
                VStack {
                    Image(systemName: "hands.clap.fill")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Dou'as")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Gold"))
                .cornerRadius(12)
            }
        }
    }
    
    private var dailyQuoteCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("MandalaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text("Citation du jour")
                    .font(.headline)
            }
            
            Text(currentQuote)
                .font(.body)
                .italic()
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }
    
    private func formatRamadanEndDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: viewModel.ramadanInfo.endDate)
    }
    
    private func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let lastOpen = Date(timeIntervalSince1970: lastOpenDate)
        let lastOpenDay = calendar.startOfDay(for: lastOpen)
        
        let dayDifference = calendar.dateComponents([.day], from: lastOpenDay, to: today).day ?? 0
        
        if dayDifference == 1 {
            streak += 1
        } else if dayDifference > 1 {
            streak = 1
        }
        
        lastOpenDate = today.timeIntervalSince1970
    }

    private var overallProgress: Double {
        let completedLessonIds = (try? JSONDecoder().decode([String].self, from: completedLessonsData)) ?? []
        let completedSet = Set(completedLessonIds)
        let allLessons = Module.allModules.flatMap(\.lessons)
        guard !allLessons.isEmpty else { return 0 }

        let completedCount = allLessons.filter { completedSet.contains($0.id) }.count
        return Double(completedCount) / Double(allLessons.count)
    }
}

#Preview {
    HomeView()
}
