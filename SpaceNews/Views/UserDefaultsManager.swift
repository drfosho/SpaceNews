//
//  UserDefaultsManager.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 11/2/23.
//

import Foundation

struct UserDefaultsManager {
    static let savedArticlesKey = "savedArticles"

    static func saveArticle(_ article: SavedArticle) {
        var savedArticles = fetchSavedArticles() // fetch already saved articles
        savedArticles.append(article) // append new article to the list
        if let encoded = try? JSONEncoder().encode(savedArticles) {
            UserDefaults.standard.set(encoded, forKey: savedArticlesKey)
        }
    }

    static func fetchSavedArticles() -> [SavedArticle] {
        if let data = UserDefaults.standard.data(forKey: savedArticlesKey),
           let decoded = try? JSONDecoder().decode([SavedArticle].self, from: data) {
            return decoded
        }
        return [] // return empty array if nothing is found
    }
}
