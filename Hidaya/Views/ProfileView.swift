import SwiftUI

struct ProfileView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("streak") private var streak: Int = 0
    @AppStorage("completedModules") private var completedModulesData: Data = Data()
    
    @State private var showResetAlert = false
    @StateObject private var parcoursVM = ParcoursViewModel()
    
    private var completedModulesCount: Int {
        (try? JSONDecoder().decode([String].self, from: completedModulesData).count) ?? 0
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    profileHeader
                    statsSection
                    settingsSection
                    resetButton
                }
                .padding()
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .alert("Réinitialiser la progression?", isPresented: $showResetAlert) {
                Button("Annuler", role: .cancel) {}
                Button("Réinitialiser", role: .destructive) {
                    resetProgress()
                }
            } message: {
                Text("Cette action est irréversible.")
            }
        }
    }
    
    private var profileHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color("EmeraldGreen").opacity(0.1))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Color("EmeraldGreen"))
            }
            
            TextField("Ton prénom", text: $userName)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .textFieldStyle(.plain)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Statistiques")
                .font(.headline)
                .foregroundColor(.secondary)
            
            HStack(spacing: 12) {
                StatCard(
                    icon: "flame.fill",
                    value: "\(streak)",
                    label: "Jours consécutifs",
                    color: .orange
                )
                
                StatCard(
                    icon: "book.fill",
                    value: "\(completedModulesCount)/6",
                    label: "Modules complétés",
                    color: Color("EmeraldGreen")
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Paramètres")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Toggle(isOn: $isDarkMode) {
                Label("Mode sombre", systemImage: "moon.fill")
            }
            .tint(Color("EmeraldGreen"))
            
            Divider()
            
            Toggle(isOn: $notificationsEnabled) {
                Label("Notifications prières", systemImage: "bell.fill")
            }
            .tint(Color("EmeraldGreen"))
            
            Divider()
            
            HStack {
                Label("Langue", systemImage: "globe")
                Spacer()
                Text("Français")
                    .foregroundColor(.secondary)
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
    
    private var resetButton: some View {
        Button(action: { showResetAlert = true }) {
            Label("Réinitialiser ma progression", systemImage: "arrow.counterclockwise")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red.opacity(0.1))
                .foregroundColor(.red)
                .cornerRadius(12)
        }
    }
    
    private func resetProgress() {
        userName = ""
        streak = 0
        completedModulesData = Data()
        parcoursVM.resetProgress()
    }
}

struct StatCard: View {
    let icon: String
    let value: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    ProfileView()
}
