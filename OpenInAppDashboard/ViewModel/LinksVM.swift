//
//  LinksVM.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import Foundation

class LinksVM: ObservableObject {
    @Published var linksData: LinkModel?
    var apiService = ApiService()
    
    func fetchLinksData() {
        apiService.fetchLinksData() { result in
            switch result {
            case .success(let dataOf):
                self.linksData = dataOf
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
}
