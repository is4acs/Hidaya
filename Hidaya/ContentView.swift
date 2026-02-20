import SwiftUI

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
    }
}

#Preview {
    ContentView()
}
