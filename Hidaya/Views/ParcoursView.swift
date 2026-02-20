import SwiftUI

struct ParcoursView: View {
    @StateObject private var viewModel = ParcoursViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    progressHeader
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.modules) { module in
                            NavigationLink(destination: ModuleDetailView(module: module)) {
                                ModuleCard(
                                    module: module,
                                    isCompleted: viewModel.isCompleted(module.id)
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Parcours")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .onAppear {
                viewModel.refreshProgress()
            }
        }
    }
    
    private var progressHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                
                Circle()
                    .trim(from: 0, to: viewModel.progressPercentage)
                    .stroke(Color("EmeraldGreen"), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: viewModel.progressPercentage)
                
                VStack {
                    Text("\(Int(viewModel.progressPercentage * 100))%")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(viewModel.completedLessonsCount)/\(viewModel.totalLessonsCount) leçons")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .frame(width: 120, height: 120)
            
            Text("Continue ton apprentissage!")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}

struct ModuleCard: View {
    let module: Module
    let isCompleted: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isCompleted ? Color("EmeraldGreen") : Color.gray.opacity(0.1))
                    .frame(width: 60, height: 60)
                
                Image(systemName: module.iconName)
                    .font(.title2)
                    .foregroundColor(isCompleted ? .white : Color("EmeraldGreen"))
                
                if isCompleted {
                    Circle()
                        .stroke(Color("Gold"), lineWidth: 2)
                        .frame(width: 60, height: 60)
                }
            }
            
            Text(module.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            Text(module.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text("\(module.lessons.count) leçons")
                .font(.caption2)
                .foregroundColor(Color("EmeraldGreen"))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color("EmeraldGreen").opacity(0.1))
                .cornerRadius(8)
            
            if isCompleted {
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("EmeraldGreen"))
                    Text("Complété")
                        .font(.caption)
                        .foregroundColor(Color("EmeraldGreen"))
                }
                .padding(.top, 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isCompleted ? Color("EmeraldGreen") : Color.clear, lineWidth: 2)
        )
    }
}

#Preview {
    ParcoursView()
}
