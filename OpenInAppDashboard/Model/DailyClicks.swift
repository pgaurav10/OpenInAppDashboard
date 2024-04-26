//
//  DailyClicks.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/25/24.
//

import Foundation

struct DailyClicks: Identifiable {
    let id = UUID()
    var time: String
    var clicks: Int
}
