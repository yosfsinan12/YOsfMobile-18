import SwiftUI

struct AppsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Featured Section
                    Text("FEATURED").font(.caption).fontWeight(.bold).foregroundColor(.gray).padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            FeaturedAppCard(title: "AshteMobile", color: .purple)
                            FeaturedAppCard(title: "Esign Pro", color: .blue)
                        }
                        .padding(.horizontal)
                    }

                    // Categories Tab
                    HStack(spacing: 0) {
                        CategoryTab(title: "ALL", isSelected: true)
                        CategoryTab(title: "APP", isSelected: false)
                        CategoryTab(title: "SIGN", isSelected: false)
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12).padding(.horizontal)

                    // App List
                    Text("All Apps").font(.title3).fontWeight(.bold).padding(.horizontal)
                    VStack(spacing: 15) {
                        AppListItem(name: "AshteMobile", version: "v2.6.0", size: "17.46 MB")
                        AppListItem(name: "Esign", version: "v5.0.2", size: "9.05 MB")
                        AppListItem(name: "Ksign", version: "v1.5", size: "21.3 MB")
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Apps")
        }
    }
}

struct FeaturedAppCard: View {
    let title: String; let color: Color
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(title).font(.headline).foregroundColor(.white)
                    Text("sign").font(.caption).foregroundColor(.white.opacity(0.8))
                }
                Spacer()
                Button("GET") {}.padding(.horizontal, 15).padding(.vertical, 5).background(.white).cornerRadius(15).foregroundColor(.blue).fontWeight(.bold)
            }
            .padding()
        }
        .frame(width: 300, height: 180).background(color).cornerRadius(25)
    }
}

struct AppListItem: View {
    let name: String; let version: String; let size: String
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "app.fill").resizable().frame(width: 55, height: 55).foregroundColor(.blue).cornerRadius(12)
            VStack(alignment: .leading, spacing: 2) {
                Text(name).fontWeight(.bold)
                Text("sign").font(.caption).foregroundColor(.gray)
                Text("\(version) • \(size)").font(.system(size: 10)).foregroundColor(.gray)
            }
            Spacer()
            Button("GET") {}.padding(.horizontal, 20).padding(.vertical, 8).background(Color.gray.opacity(0.1)).cornerRadius(15).foregroundColor(.blue).fontWeight(.bold)
        }
        .padding().background(Color.white).cornerRadius(20).shadow(color: .black.opacity(0.03), radius: 5)
    }
}

struct CategoryTab: View {
    let title: String; let isSelected: Bool
    var body: some View {
        Text(title).frame(maxWidth: .infinity).padding(.vertical, 10).background(isSelected ? Color.blue : Color.clear).foregroundColor(isSelected ? .white : .gray).fontWeight(.bold).font(.system(size: 12))
    }
}
