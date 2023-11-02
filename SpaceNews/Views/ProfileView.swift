//
//  ProfileView.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 11/1/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var savedArticle: [SavedArticle] {
        UserDefaultsManager.fetchSavedArticles()
    }
    
    var body: some View {
        List(savedArticle) { article in
            Text(article.title)
        }
    }
}

