//
//  SpaceArticle.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 8/9/22.
//

import SwiftUI
import CachedAsyncImage

struct SpaceArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
            CachedAsyncImage(url: URL(string: imageUrl),
                transaction: Transaction(animation: .easeInOut)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .transition(.opacity)
                } else {
                    HStack {
                        ProgressView()
                        
                    }
                }
            }
                
        }
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(6)
                .font(.body)
                .padding(8)
    }
}
}
struct SpaceArticle_Previews: PreviewProvider {
    static var previews: some View {
        SpaceArticle(title: "New Landing!", imageUrl: "...", siteName: "Space News", summary: "A New rocket has landed!")
    }
}
