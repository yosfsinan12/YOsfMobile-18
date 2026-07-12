import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Welcome Banner
                    HStack {
                        Text("✨ Welcome to Ashte").font(.subheadline).fontWeight(.medium)
                        Spacer()
                    }
                    .padding().background(Color.white).cornerRadius(20).shadow(color: .black.opacity(0.05), radius: 5)

                    // VIP Access Card
                    Text("💎 VIP Access").font(.headline).fontWeight(.bold)
                    HStack(spacing: 15) {
                        Image(systemName: "checkmark.seal.fill")
                            .resizable().frame(width: 45, height: 45).foregroundColor(.blue)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CERTIFICATES").font(.system(size: 16, weight: .bold)).foregroundColor(.blue)
                            Text("ESign & KSign (1 Year)").font(.caption).fontWeight(.semibold)
                            Text("15,000 IQD • FASTPAY • IFB").font(.system(size: 10)).foregroundColor(.gray)
                        }
                        Spacer()
                        Button("BUY") {}.padding(.horizontal, 20).padding(.vertical, 8).background(Color.blue).foregroundColor(.white).cornerRadius(20).font(.system(size: 14, weight: .bold))
                    }
                    .padding().background(Color.white).cornerRadius(25).shadow(color: .black.opacity(0.05), radius: 8)

                    // Signing Apps Section
                    Text("Signing Apps").font(.headline).fontWeight(.bold)
                    HStack(spacing: 15) {
                        SignCard(name: "Esign", color: .orange, icon: "e.square.fill")
                        SignCard(name: "Ksign", color: .blue, icon: "k.square.fill")
                    }

                    // Social Media Grid
                    Text("Social Media").font(.headline).fontWeight(.bold)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        SocialBox(name: "Instagram", icon: "camera.fill", color: Color.pink)
                        SocialBox(name: "Telegram", icon: "paperplane.fill", color: Color.blue)
                        SocialBox(name: "TikTok", icon: "music.note", color: Color.black)
                        SocialBox(name: "Snapchat", icon: "ghost.fill", color: Color.yellow)
                    }
                }
                .padding()
            }
            .navigationTitle("AshteMobile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Circle().fill(Color.green).frame(width: 8, height: 8)
                        Text("Signed").font(.caption).fontWeight(.bold).foregroundColor(.green)
                    }
                    .padding(.horizontal, 10).padding(.vertical, 5).background(Color.green.opacity(0.1)).cornerRadius(15)
                }
            }
        }
    }
}

struct SignCard: View {
    let name: String; let color: Color; let icon: String
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon).resizable().frame(width: 55, height: 55).foregroundColor(color).cornerRadius(15)
            Text(name).font(.headline)
            Text("\(name) Links").font(.caption).foregroundColor(.gray)
            Button("Open") {}.frame(maxWidth: .infinity).padding(.vertical, 10).background(color.opacity(0.1)).foregroundColor(color).cornerRadius(15).fontWeight(.bold)
        }
        .padding().background(Color.white).cornerRadius(25).shadow(color: .black.opacity(0.05), radius: 8)
    }
}

struct SocialBox: View {
    let name: String; let icon: String; let color: Color
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon).font(.title).foregroundColor(.white)
            Text(name).foregroundColor(.white).fontWeight(.bold).font(.system(size: 14))
        }
        .frame(maxWidth: .infinity).frame(height: 100).background(color).cornerRadius(25)
    }
}
