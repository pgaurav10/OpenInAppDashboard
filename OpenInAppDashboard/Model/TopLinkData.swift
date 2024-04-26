//
//  TopLinkData.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import Foundation

struct TopLinkData: Decodable, Hashable {
    let imageT: String
    let app: String
    let totalClicks: Int
    let createdAt: String
    let webLink: String
    
    private enum CodingKeys: String, CodingKey {
        
        case imageT = "original_image"
        case app = "app"
        case totalClicks = "total_clicks"
        case createdAt = "created_at"
        case webLink = "web_link"
    }
    
}
