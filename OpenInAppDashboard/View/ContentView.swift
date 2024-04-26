//
//  ContentView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                Dashboard()
                    .tabItem {
                        Image(systemName: "link")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19, height: 19)
                            .foregroundColor(.black)
                        Text("Links")
                            .foregroundColor(.black)
                            .font(.custom("Figtree", size: 12))
                    }
                    .tag(0)

                Text("Second View")
                    .tabItem {
                        Image(systemName: "book")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(hex: 0x999CA0))
                        Text("Courses")
                            .foregroundColor(Color(hex: 0x999CA0))
                            .font(.custom("Figtree", size: 12))
                    }
                    .tag(1)
                
                Spacer()
                    .tabItem {
                        EmptyView()
                    }
                    .tag(2)
                
                Text("Third View")
                    .tabItem {
                        Image(systemName: "horn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(hex: 0x999CA0))
                        Text("Campaigns")
                            .font(.custom("Figtree", size: 12))
                            .foregroundColor(Color(hex: 0x999CA0))
                    }
                    .tag(3)
                
                Text("Fourth View")
                    .tabItem {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(hex: 0x999CA0))
                        Text("Profile")
                            .font(.custom("Figtree", size: 12))
                            .foregroundColor(Color(hex: 0x999CA0))
                    }
                    .tag(4)
            }
            Button {
               print("Add button pressed")
            } label: {
                Image(systemName: "plus")
                    .tint(.white)
            }
            .frame(width: 60, height: 60)
            .background(Color.blue)
            .clipShape(Circle())
            
        }
        .ignoresSafeArea(.keyboard)
        .onChange(of: selection) { [selection] newValue in
           if newValue == 2 {
               self.selection = selection
           }
        }
    }
}

#Preview {
    ContentView()
}
