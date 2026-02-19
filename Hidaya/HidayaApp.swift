import SwiftUI
import UserNotifications

@main
struct HidayaApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {
        setupAppearance()
        requestNotificationPermission()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    private func setupAppearance() {
        let accentColor = UIColor(Color("EmeraldGreen"))
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
        UINavigationBar.appearance().tintColor = accentColor
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
}
