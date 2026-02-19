import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(0)
            
            ParcoursView()
                .tabItem {
                    Label("Parcours", systemImage: "book.fill")
                }
                .tag(1)
            
            WuduGuideView()
                .tabItem {
                    Label("Wudu", systemImage: "drop.fill")
                }
                .tag(2)
            
            DuasView()
                .tabItem {
                    Label("Dou'as", systemImage: "hands.clap.fill")
                }
                .tag(3)
            
            SurahView()
                .tabItem {
                    Label("Sourates", systemImage: "text.book.closed.fill")
                }
                .tag(4)
        }
        .tint(Color("EmeraldGreen"))
        .onAppear {
            schedulePrayerNotifications()
        }
    }
    
    private func schedulePrayerNotifications() {
        let center = UNUserNotificationCenter.current()
        let prayers = [
            ("Fajr", "06:00"),
            ("Dhuhr", "13:00"),
            ("Asr", "16:30"),
            ("Maghrib", "19:00"),
            ("Isha", "21:00")
        ]
        
        for (index, prayer) in prayers.enumerated() {
            let content = UNMutableNotificationContent()
            content.title = "\(prayer.0) - Heure de la prière"
            content.body = "C'est l'heure de \(prayer.0). Qu'Allah accepte ta prière."
            content.sound = .default
            
            let dateComponents = prayer.1.split(separator: ":").compactMap { Int($0) }
            if dateComponents.count == 2 {
                var components = DateComponents()
                components.hour = dateComponents[0]
                components.minute = dateComponents[1]
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                let request = UNNotificationRequest(identifier: "prayer_\(index)", content: content, trigger: trigger)
                center.add(request)
            }
        }
    }
}

#Preview {
    ContentView()
}
