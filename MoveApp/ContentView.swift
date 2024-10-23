//
//  SwiftUIView.swift
//  MountainApp
//
//  Created by Foundation on 10/11/24.
//
//  탭바
import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            TabView {
                ProfileView()
                    .tabItem { Label("Home", systemImage: "house") }.tag(1)
                PostView()
                    .tabItem { Label("Run", systemImage: "figure.run")}.tag(2)
                ChatView()
                    .tabItem { Label("Chat", systemImage: "message")}.tag(3)
            }
            .accentColor(.cyan)
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ContentView()
}
