//
//  SwiftUIView.swift
//  MountainApp
//
//  Created by Foundation on 10/11/24.
//
//  탭바
import SwiftUI

struct ContentView: View {
    enum Tab {
        case profile, post, chat
    }
    
    @State private var selected: Tab = .profile
    @State private var isActive: Bool = false
    @StateObject var postManager = PostManager()
    
    var body: some View {
        if isActive {
            TabView(selection: $selected) {
                ProfileView()
                    .tabItem { Label("Home", systemImage: "house") }.tag(Tab.profile)
                PostView(postManager: postManager)
                    .tabItem { Label("Run", systemImage: "figure.run")}.tag(Tab.post)
                ChatView()
                    .tabItem { Label("Chat", systemImage: "message")}.tag(Tab.chat)
            }
            .accentColor(Color(red: 0.518, green: 0.333, blue: 0.965))
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ContentView()
}
