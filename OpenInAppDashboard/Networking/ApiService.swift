//
//  ApiService.swift
//  OpenInAppDashboard
//
//  Created by Gaurav Patil on 4/24/24.
//

import Foundation

struct ApiService {
    
    func fetchLinksData(completion: @escaping (Result<LinkModel,Error>) -> Void ) {
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        
        let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    do {
                        
                        let result = try decoder.decode(LinkModel.self, from: data)
                        DispatchQueue.main.async {
                            
                            completion(.success(result))
                        }
                        
                    } catch {
                        print(error)
                        completion(.failure(error))
                    }
                        
                } else {
                    print("HTTP status code: \(httpResponse.statusCode)")
                }
            } else {
                print("Invalid response")
            }
        }
        
        task.resume()
    }
    
}
