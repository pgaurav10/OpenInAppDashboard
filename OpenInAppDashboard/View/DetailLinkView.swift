//
//  DetailLinkView.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import SwiftUI

struct DetailLinkView: View {
    var image: String
    var title: String
    var desc: String
    var value: String
    var link: String
    @State private var isCopied = false
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return "Invalid Date"
        }

        dateFormatter.dateFormat = "dd MMM yyyy" 
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                AsyncImage(url: URL(string: self.image)) { image in
                    image.resizable()
                        .frame(width: 50, height: 50, alignment: .leading)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.title)
                        .font(.custom("Figtree", size: 18))
                        .padding(.leading, 20)
                    Text(self.formatDate(self.desc))
                        .font(.subheadline)
                        .padding(.leading, 20)
                        .foregroundColor(Color(hex: 0x999CA0))
                }
                
                Spacer()
                
                // Value and label
                VStack(alignment: .trailing, spacing: 5) {
                    Text(self.value)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Clicks")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: 0x999CA0))
                }
                .padding(.trailing, 20)
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.bottom, 10)
        
            HStack {
                Text(self.link)
                    .foregroundColor(Color(hex: 0x0E6FFF))
                    .padding()
                Spacer()
                Button(action: {
                    print("Link copied!")
                    UIPasteboard.general.string = self.link
                    isCopied = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isCopied = false
                    }
                }) {
                    Image(systemName: "doc.on.doc" )
                        .foregroundColor(Color(hex: 0x0E6FFF))
                        .padding()
                        .cornerRadius(8)
                }
                .alert(isPresented: $isCopied) {
                    Alert(title: Text("Copied"), message: Text("Link copied to clipboard"), dismissButton: .default(Text("OK")))
                }
            }
            .background(Color(hex: 0xA6C7FF))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(.blue)
            )
            
        }
        .background(.white)
    }
}

#Preview {
    DetailLinkView(image: "photo", title: "Title", desc: "Description", value: "Value", link: "www.example.com")
}
