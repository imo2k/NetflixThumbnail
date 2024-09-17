//
//  ContentView.swift
//  NetflixThumbnail
//
//  Created by GO on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .toolbarBackground(.black, for: .tabBar)
            Text("Tab 2 View")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            Text("Tab 3 View")
                .tabItem {
                    Image(systemName: "play.rectangle.on.rectangle")
                    Text("New & Hot")
                }
            Text("Tab 4 View")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Netfilx")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
