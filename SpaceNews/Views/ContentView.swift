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
    
    var body: some View {
        NavigationView {
            VStack {
                SpaceView()
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
