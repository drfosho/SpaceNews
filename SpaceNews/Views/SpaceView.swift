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
    private var textWidth = 300.0
    
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                NavigationLink(destination: DetailView(url: news.url)) {

                SpaceArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)

            }
            }
            .refreshable {
                data.getData()
            }
        }
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceView()
            .environmentObject(GalaxyApi())
    }
}
