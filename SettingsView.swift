import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView().tag(0)
                AppsView().tag(1)
                Text("IPA Manager").tag(2)
                SettingsView().tag(3)
            }
            
            // Tab Bar ی مۆدێرن و خڕ وەک وێنەکە
            HStack(spacing: 35) {
                TabButton(icon: "house.fill", label: "Home", isSelected: selectedTab == 0) { selectedTab = 0 }
                TabButton(icon: "app.badge.fill", label: "Apps", isSelected: selectedTab == 1) { selectedTab = 1 }
                TabButton(icon: "box.truck.fill", label: "IPA", isSelected: selectedTab == 2) { selectedTab = 2 }
                TabButton(icon: "gearshape.fill", label: "Settings", isSelected: selectedTab == 3) { selectedTab = 3 }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .background(Color.white.opacity(0.95))
            .cornerRadius(35)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
    }
}

struct TabButton: View {
    let icon: String; let label: String; let isSelected: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon).font(.system(size: 20))
                Text(label).font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(isSelected ? .blue : .gray.opacity(0.6))
        }
    }
}
