//
//  ApiData.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 8/9/22.
//
//api: https://api.spaceflightnewsapi.net/v3/articles


import Foundation

struct GalaxyData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
    
}

struct SavedArticle: Identifiable, Codable {
    let id = UUID()
    let title: String
    let url: String
}

@MainActor class GalaxyApi: ObservableObject {
    @Published var news: [GalaxyData] = []
    
    
    func getData() {
        
        guard let url = URL(string:
            "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else {
            return
            
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let temporaryError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [GalaxyData(id: 0, title: "Error", url: "Error retreiving URL", imageUrl: "No Image found", newsSite: "No internet", summary: "Get on wifi/data as soon as possible", publishedAt: "No date found")]
                }
                return
            }
           
            
            let galaxyData = try! JSONDecoder().decode([GalaxyData].self, from: data)
            
            DispatchQueue.main.async {
                print("Loaded new articles successfully. Articles: \(galaxyData.count)")
                self.news = galaxyData
            }
        }
        .resume()
    }
}
