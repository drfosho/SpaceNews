//
//  ContentView.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 8/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = GalaxyApi()
    @State private var opac = 0.0
    @State private var savedArticles = [SavedArticle]()
    
    // eventually create a state or variable for the name, for now it will be hardcoded
    @State private var name = "Kevin"
    
    var body: some View {
        NavigationView {
            VStack {
                //Adding clickable profile image here
                HStack {
                    Text("Welcome Back \(name)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    }
                }
      
                            
                // Existing SpaceView
                SpaceView(savedArticles: $savedArticles)
                    .opacity(opac)
            }
            .navigationTitle("Space News")
            .environmentObject(data)
            .onAppear() {
                data.getData()
                
                withAnimation(.easeInOut(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
