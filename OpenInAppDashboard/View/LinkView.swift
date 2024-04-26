//
//  LinkView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct LinkView: View {
    
    @ObservedObject var linksVM = LinksVM()
    @State var displayLinks = [TopLinkData]()
    @State private var isButton1Toggled = false
    @State private var isButton2Toggled = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("First button tapped!")
                    isButton1Toggled = true
                    isButton2Toggled = false
                    self.displayLinks = self.linksVM.linksData?.dataM.topLinks ?? []
                }) {
                    Text("Top Links")
                        .font(.custom("Figtree", size: 18))
                        .foregroundColor(isButton1Toggled ? .white : Color(hex: 0x999CA0))
                        .padding()
                        .background(isButton1Toggled ? Color.blue: Color(hex: 0xF5F5F5, alpha: 0.5))
                        .cornerRadius(40)
                }
                
                Button(action: {
                    print("Second button tapped!")
                    isButton2Toggled = true
                    isButton1Toggled = false
                    self.displayLinks = self.linksVM.linksData?.dataM.recentLinks ?? []
                    
                }) {
                    Text("Recent Links")
                        .font(.custom("Figtree", size: 18))
                        .foregroundColor(isButton2Toggled ? .white : Color(hex: 0x999CA0))
                        .padding()
                        .background(isButton2Toggled ? Color.blue: Color(hex: 0xF5F5F5, alpha: 0.5))
                        .cornerRadius(40)
                }
                
                Spacer()
                Image(systemName: "magnifyingglass")
                    .frame(width: 40, height: 40)
                    .border(Color(hex: 0xD8D8D8))
                
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
               
               ForEach(displayLinks, id: \.self) { item in
                   VStack(spacing: 20) {
                       DetailLinkView(image: item.imageT, title: item.app, desc: item.createdAt, value: String(item.totalClicks), link: item.webLink)
                   }.background(
                    RoundedRectangle(cornerRadius: 10)
                )
               }
            }
            .padding()
        }
    }
}

#Preview {
    LinkView()
}
