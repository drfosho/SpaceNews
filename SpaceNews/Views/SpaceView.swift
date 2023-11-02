//
//  SpaceView.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 8/9/22.
//

import SwiftUI

struct SpaceView: View {
    @EnvironmentObject var data : GalaxyApi
    @Environment(\.openURL) var openURL
    var textWidth = 300.0
    @Binding var savedArticles: [SavedArticle]
    
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                NavigationLink(destination: DetailView(url: news.url)) {

                SpaceArticle(
                    title: news.title,
                    imageUrl: news.imageUrl,
                    siteName: news.newsSite,
                    summary: news.summary,
                    onSave: {
                    let savedArticle = SavedArticle(title: news.title, url: news.url)
                        UserDefaultsManager.saveArticle(savedArticle)

            }
                    )
            }
                    }
            .refreshable {
                data.getData()
            }
        }
    }
}

struct SpaceView_Previews: PreviewProvider {
    @State static var mockSavedArticles: [SavedArticle] = []
    
    static var previews: some View {
        SpaceView(savedArticles: $mockSavedArticles)
            .environmentObject(GalaxyApi())
    }
}
