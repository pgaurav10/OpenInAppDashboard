//
//  BlockView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct BlockView: View {
    var symbol: String
    var value: String
    var header: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(symbol)
                .resizable()
                .scaledToFit() 
                .frame(width: 50, height: 50)
            Text(value)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 20)
            Text(header)
                .font(.subheadline)
                .font(.custom("Figtree", size: 12))
                .foregroundColor(Color(hex: 0x999CA0))
        }
        .padding(.leading, -30)
        .frame(width: 150, height: 150)
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}

#Preview {
    BlockView(symbol: "loc", value: "123", header: "Total clicks")
}
