import SwiftUI

struct WuduGuideView: View {
    @StateObject private var viewModel = WuduViewModel()
    @State private var showInvalidators = false
    @State private var showTayammum = false
    @State private var animateIcon = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerView
                    
                    if viewModel.showCompletionMessage {
                        completionView
                    } else if let step = viewModel.currentStepData {
                        stepView(step)
                    }
                    
                    bonusSections
                }
                .padding()
            }
            .navigationTitle("Guide Wudu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Étape \(viewModel.currentStep + 1) sur \(viewModel.steps.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: { 
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        viewModel.isPracticeMode.toggle()
                    }
                }) {
                    Text(viewModel.isPracticeMode ? "Mode Pratique" : "Mode Apprentissage")
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(viewModel.isPracticeMode ? Color("EmeraldGreen") : Color.gray.opacity(0.15))
                        .foregroundColor(viewModel.isPracticeMode ? .white : .primary)
                        .cornerRadius(20)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color("EmeraldGreen"))
                        .frame(width: geometry.size.width * viewModel.progress, height: 8)
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: viewModel.progress)
                }
            }
            .frame(height: 8)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 8, y: 4)
    }
    
    private func stepView(_ step: WuduStep) -> some View {
        VStack(spacing: 28) {
            ZStack {
                Circle()
                    .fill(Color("EmeraldGreen").opacity(0.15))
                    .frame(width: 120, height: 120)
                    .scaleEffect(animateIcon ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateIcon)
                
                Image(systemName: step.sfSymbol)
                    .font(.system(size: 50, weight: .medium))
                    .foregroundColor(Color("EmeraldGreen"))
                    .onAppear { animateIcon = true }
            }
            
            Text(step.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            if !step.arabicDua.isEmpty {
                VStack(spacing: 8) {
                    Text(step.arabicDua)
                        .font(.custom("Amiri", size: 26))
                        .multilineTextAlignment(.trailing)
                        .environment(\.layoutDirection, .rightToLeft)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("Gold").opacity(0.12))
                        )
                }
            }
            
            if !viewModel.isPracticeMode {
                VStack(spacing: 14) {
                    if !step.transliteration.isEmpty {
                        Text(step.transliteration)
                            .font(.body.italic())
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    if !step.translation.isEmpty {
                        Text(step.translation)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                    }
                    
                    Text(step.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                }
            }
            
            repetitionsView(step.repetitions)
            
            navigationButtons
        }
        .padding(24)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.08), radius: 12, y: 6)
        .transition(.asymmetric(
            insertion: .scale(scale: 0.95).combined(with: .opacity),
            removal: .scale(scale: 0.95).combined(with: .opacity)
        ))
        .id(viewModel.currentStep)
    }
    
    private func repetitionsView(_ count: Int) -> some View {
        HStack(spacing: 10) {
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    .fill(Color("EmeraldGreen"))
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle()
                            .stroke(Color("EmeraldGreen").opacity(0.3), lineWidth: 2)
                            .frame(width: 20, height: 20)
                    )
            }
            
            if count > 1 {
                Text("×\(count)")
                    .font(.subheadline.bold())
                    .foregroundColor(Color("EmeraldGreen"))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color("EmeraldGreen").opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 8)
    }
    
    private var navigationButtons: some View {
        HStack(spacing: 16) {
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    viewModel.previousStep()
                }
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Text("Précédent")
                }
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(viewModel.isFirstStep ? Color.gray.opacity(0.15) : Color("EmeraldGreen").opacity(0.15))
                .foregroundColor(viewModel.isFirstStep ? .gray : Color("EmeraldGreen"))
                .cornerRadius(12)
            }
            .disabled(viewModel.isFirstStep)
            
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    viewModel.nextStep()
                }
            }) {
                HStack(spacing: 6) {
                    if viewModel.isLastStep {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Terminer")
                    } else {
                        Text("Suivant")
                        Image(systemName: "chevron.right")
                    }
                }
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color("EmeraldGreen"))
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
    }
    
    private var completionView: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(Color("EmeraldGreen").opacity(0.15))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color("EmeraldGreen"))
            }
            
            Text("Masha'Allah!")
                .font(.title.bold())
                .foregroundColor(.primary)
            
            Text("Tu as terminé le guide du Wudu.\nQu'Allah accepte tes ablutions.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    viewModel.reset()
                }
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Recommencer")
                }
                .font(.subheadline.bold())
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .padding(.horizontal, 32)
                .background(Color("EmeraldGreen"))
                .cornerRadius(12)
            }
        }
        .padding(32)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.08), radius: 12, y: 6)
    }
    
    private var bonusSections: some View {
        VStack(spacing: 16) {
            DisclosureGroup(isExpanded: $showInvalidators) {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach([
                        "Tout ce qui sort des voies naturelles",
                        "Perte de conscience (sommeil profond, évanouissement)",
                        "Toucher direct des parties intimes",
                        "Contact peau à peau (selon certaines écoles)"
                    ], id: \.self) { text in
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.subheadline)
                            Text(text)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding()
            } label: {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                    Text("Ce qui annule le Wudu")
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 4, y: 2)
            
            DisclosureGroup(isExpanded: $showTayammum) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Le Tayammum est autorisé en cas de:")
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                    
                    ForEach([
                        "Absence d'eau ou quantité insuffisante",
                        "Impossible d'utiliser l'eau (maladie)",
                        "L'eau est trop froide et risque de nuire"
                    ], id: \.self) { text in
                        HStack(alignment: .top, spacing: 8) {
                            Text("•")
                                .foregroundColor(Color("EmeraldGreen"))
                            Text(text)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Divider()
                    
                    Text("Comment faire:")
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach([
                            "1. Niyya (intention)",
                            "2. Dire Bismillah",
                            "3. Frapper les mains sur la terre propre",
                            "4. Passer les mains sur le visage",
                            "5. Passer les mains sur les bras"
                        ], id: \.self) { text in
                            Text(text)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding()
            } label: {
                HStack {
                    Image(systemName: "hand.raised.fill")
                        .foregroundColor(Color("EmeraldGreen"))
                    Text("Tayammum - Ablution sèche")
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 4, y: 2)
        }
    }
}

#Preview {
    WuduGuideView()
}
