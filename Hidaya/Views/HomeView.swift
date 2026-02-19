import SwiftUI

struct HomeView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("streak") private var streak: Int = 0
    @AppStorage("lastOpenDate") private var lastOpenDate: Double = 0
    
    private let quotes = [
        "Le Prophète ﷺ a dit: « La prière est la lumière de celui qui prie. »",
        "« En vérité, c'est dans le rappel d'Allah que les cœurs trouvent la paix. » - Coran 13:28",
        "« Allah est Beau et Il aime la beauté. » - Hadith",
        "« Les meilleures œuvres auprès d'Allah sont les plus régulières, même si elles sont peu. » - Hadith"
    ]
    
    @State private var currentQuote: String = ""
    private let prayers = PrayerTime.getTodayPrayers()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    greetingCard
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
            }
        }
    }
    
    private var greetingCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: PrayerTimeHelper.getTimeIcon())
                    .font(.largeTitle)
                    .foregroundColor(Color("Gold"))
                
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
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var prayerTimesCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(Color("EmeraldGreen"))
                Text("Horaires de prière")
                    .font(.headline)
                Spacer()
                Text(formatDate(Date()))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            ForEach(prayers, id: \.name) { prayer in
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
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(Color("EmeraldGreen"))
                Text("Ta progression")
                    .font(.headline)
            }
            
            ProgressView(value: 0.3)
                .progressViewStyle(LinearProgressViewStyle(tint: Color("EmeraldGreen")))
            
            Text("30% du parcours débutant complété")
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
                Image(systemName: "quote.opening")
                    .foregroundColor(Color("Gold"))
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
}

#Preview {
    HomeView()
}
