import SwiftUI

struct ContentView: View {
    // بۆ دیاریکردنی ئەوەی کام تاب هەڵبژێردراوە
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // بەشەکانی ئەپەکە لێرەدا بانگ دەکرێن
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                AppsView()
                    .tag(1)
                
                // بەشی IPA (دەتوانیت لە داهاتوودا فایلێکی بۆ دروست بکەیت)
                Color.white
                    .tag(2)
                    .overlay(Text("IPA Manager").font(.headline))
                
                SettingsView()
                    .tag(3)
            }
            
            // دروستکردنی Tab Bar ی خڕ و مۆدێرن (ڕێک وەک وێنەکان)
            HStack(spacing: 0) {
                CustomTabItem(icon: "house.fill", label: "Home", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                
                CustomTabItem(icon: "app.badge.fill", label: "Apps", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                
                CustomTabItem(icon: "box.truck.fill", label: "IPA", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                
                CustomTabItem(icon: "gearshape.fill", label: "Settings", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.95))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal, 25)
            .padding(.bottom, 25) // بۆ ئەوەی لە خوارەوە کەمێک بەرز بێت
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// پێکهاتەی دوگمەکانی ناو تاب بارەکە
struct CustomTabItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .semibold))
                Text(label)
                    .font(.system(size: 10, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(isSelected ? Color.blue : Color.gray.opacity(0.6))
        }
    }
}

#Preview {
    ContentView()
}
