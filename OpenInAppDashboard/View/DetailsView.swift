//
//  DetailsView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var linksVM = LinksVM()
    private func updateTimeOfDay() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        
        // Get the current hour
        let currentHour = Int(dateFormatter.string(from: Date())) ?? 0
        
        // Determine time of day based on hour
        if currentHour >= 6 && currentHour < 12 {
            return "Good Morning"
        } else if currentHour >= 12 && currentHour < 18 {
            return "Good Afternoon"
        } else if currentHour >= 18 && currentHour < 24 {
            return "Good Evening"
        } else {
            return "Good Night"
        }
    }
    var body: some View {
        VStack {
            HStack {
                Text(self.updateTimeOfDay())
                    .font(.custom("Figtree", size: 16))
                    .foregroundColor(Color(hex: 0x999CA0))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
                    .padding(.top, 30)
                Spacer()
            }
            HStack {
                Text("Gaurav Patil")
                    .font(.custom("Figtree", size: 28))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
                Image("Wave")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                Spacer()
            }
            ChartView(data: self.linksVM.linksData?.dataM.clicksData ?? [:])
            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 20) { 
                   BlockView(symbol: "clicks", value: String(self.linksVM.linksData?.todayClicks ?? 0), header: "Today's Clicks")
                   BlockView(symbol: "loc", value: self.linksVM.linksData?.topLoc ?? "N/A", header: "Top Location")
                   BlockView(symbol: "source", value: self.linksVM.linksData?.topSource ?? "N/A", header: "Top Source")
                   BlockView(symbol: "time", value: self.linksVM.linksData?.startTime ?? "N/A", header: "Best Time")
                   
               }
            }
            Button(action: {
                print("View Analytics")
            }) {
                HStack {
                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .foregroundColor(Color(hex: 0x999CA0))
                        .frame(width: 12, height: 12)
                    Text("View Analytics")
                        .font(.custom("Figtree", size: 12))
                        .foregroundColor(.black)
                }
            }
            .padding()
            .frame(maxWidth: 350)
            .border(Color(hex: 0xD8D8D8))
            .cornerRadius(2)
            LinkView(linksVM: self.linksVM)
            Button(action: {
                print("View all links")
            }) {
                HStack {
                    Image(systemName: "link")
                        .resizable()
                        .foregroundColor(Color(hex: 0x999CA0))
                        .frame(width: 12, height: 12)
                    Text("View all links")
                        .font(.custom("Figtree", size: 12))
                        .foregroundColor(.black)
                }
            }
            .padding()
            .frame(maxWidth: 350)
            .border(Color(hex: 0xD8D8D8))
            .cornerRadius(2)
        
            Button(action: {
                print("Whatsappp: \(String(describing: self.linksVM.linksData?.whatsappNo))")
            }) {
                HStack() {
                    Image(systemName: "message")
                        .resizable()
                        .foregroundColor(Color(hex: 0x4AD15F))
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                    
                    Text("Talk with us")
                        .font(.custom("Figtree", size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
            .padding()
            .frame(alignment: .leading)
            .frame(maxWidth: 350)
            .border(Color(hex: 0x4AD15F))
            .background(Color(hex: 0x4AD15F, alpha: 0.3))
            .cornerRadius(2)
            
            Button(action: {
                print("Frequently Asked Questions")
            }) {
                HStack() {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .foregroundColor(Color(hex: 0x0E6FFF))
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                    
                    Text("Frequently Asked Questions")
                        .font(.custom("Figtree", size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
            .padding()
            .frame(alignment: .leading)
            .frame(maxWidth: 350)
            .border(Color(hex: 0x0E6FFF))
            .background(Color(hex: 0x0E6FFF, alpha: 0.5))
            .cornerRadius(2)
        }
        .cornerRadius(2)
    }
}

#Preview {
    DetailsView()
}
