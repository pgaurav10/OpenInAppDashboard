//
//  LinkModel.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import Foundation


struct LinkModel: Decodable {
    
    let extraIncome: CLongDouble
    let whatsappNo: String
    let todayClicks: Int
    let topLoc: String
    let topSource: String
    let totalClicks: Int
    let totalLinks: Int
    let dataM: DataM
    let startTime: String
    
    // Define custom CodingKeys to handle dynamic ingredient keys
    private enum CodingKeys: String, CodingKey {
        
        case extraIncome = "extra_income"
        case whatsappNo = "support_whatsapp_number"
        case todayClicks = "today_clicks"
        case topLoc = "top_location"
        case topSource = "top_source"
        case totalClicks = "total_clicks"
        case totalLinks = "total_links"
        case dataM = "data"
        case startTime = "startTime"
    }
}

struct DataM : Decodable {
    let clicksData: [String: Int]
    let topLinks: [TopLinkData]
    let recentLinks: [TopLinkData]
    
    private enum CodingKeys: String, CodingKey {
        case clicksData = "overall_url_chart"
        case topLinks = "top_links"
        case recentLinks = "recent_links"
    }
}
