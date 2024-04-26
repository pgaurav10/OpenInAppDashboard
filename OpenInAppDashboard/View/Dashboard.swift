//
//  Dashboard.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct Dashboard: View {
    @ObservedObject var linksVM = LinksVM()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 24)!]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                DetailsView(linksVM: self.linksVM)
            }
            .background(Color(hex: 0xF5F5F5))
            .clipShape(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .inset(by: -5) // Adjust this value to tilt the corners more or less
            )
            .navigationBarItems(leading: HStack {
                Text("Dashboard")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
            })
            .toolbarBackground(Color(hex: 0x0E6FFF), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    print("About tapped!")
                    
                }) {
                    Image(systemName: "gearshape")
                        .foregroundColor(.white)
                }
            }
            
        }.onAppear(perform: {
            self.linksVM.fetchLinksData()
        })
    }
}

#Preview {
    Dashboard()
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
