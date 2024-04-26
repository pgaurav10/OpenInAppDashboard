//
//  ChartView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var clicksData: [String: Int]
    var clicksD: [DailyClicks]
    let curGradient = LinearGradient(
        gradient: Gradient (
            colors: [
                Color(.blue).opacity(0.4),
                Color(.blue).opacity(0.0)
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    
    init(data: [String:Int]) {
        self.clicksData = data
        self.clicksD = self.clicksData.map { DailyClicks(time: $0.key, clicks: $0.value) }
            .sorted { $0.time < $1.time }
    }
    
    func mergeConsecutivePoints(_ data: [DailyClicks]) -> [DailyClicks] {
        var mergedData: [DailyClicks] = []

        var currentPoint: DailyClicks?
        var flag = 0
        for point in data {
            if let current = currentPoint {
                if point.clicks == current.clicks {
                    if flag == 1 {
                        continue
                        
                    }
                    flag = 1
                } else {
                    flag = 0
                }
                mergedData.append(current)
            }
            
            currentPoint = point
        }

        if let last = currentPoint {
            mergedData.append(last)
        }

        return mergedData
    }
    
    var body: some View {
        Section {
            VStack {
                HStack{
                    Text("Overview")
                        .font(.custom("Figtree", size: 14)) // Set custom font and size
                        .foregroundColor(Color(hex: 0x999CA0))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                    Button(action: {
                        print("Select Date")
                    }) {
                        HStack {
                            Text("22 Aug - 23 Sept")
                                .font(.custom("Figtree", size: 12))
                                .foregroundColor(.black)
                            Image(systemName: "clock")
                                .resizable()
                                .foregroundColor(Color(hex: 0x999CA0))
                                .frame(width: 12, height: 12)
                        }
                        .padding(EdgeInsets(top: 6, leading: 4, bottom: 4, trailing: 6))
                        .border(Color(hex: 0x999CA0))
                        .cornerRadius(3)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                }
                Chart(self.mergeConsecutivePoints(self.clicksD)) { item in
                    LineMark(
                        x: .value("Time", item.time),
                        y: .value("Clicks", item.clicks)
                    )
                    .foregroundStyle(.blue)

                    AreaMark(
                        x: .value("Time", item.time),
                        y: .value("Clicks", item.clicks)
                    )
                    .foregroundStyle(curGradient)
                }
                .padding()
            }
            .background(Color.white)
            .padding(.all, 12)
            .cornerRadius(10)
        }
        
    }
}

#Preview {
    ChartView(data: [:])
}
