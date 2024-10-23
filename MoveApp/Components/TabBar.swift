//
//  TabBar.swift
//  MoveApp
//
//  Created by Muchan Kim on 10/24/24.
//  임시

import SwiftUI

struct TabBar: View {
    enum Tab {
            case a, b, c
        }
        
        @State private var selected: Tab = .a
        
        var body: some View {
            ZStack {
                TabView(selection: $selected) {
                    Group {
                        NavigationStack {
                            AView()
                        }
                        .tag(Tab.a)
                        
                        NavigationStack {
                            BView()
                        }
                        .tag(Tab.b)
                        
                        NavigationStack {
                            CView()
                        }
                        .tag(Tab.c)
                    }
                    .toolbar(.hidden, for: .tabBar)
                }
                
                VStack {
                    Spacer()
                    tabBar
                }
            }
        }
        
        var tabBar: some View {
            HStack {
                Spacer()
                Button {
                    selected = .a
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                        if selected == .a {
                            Text("View A")
                                .font(.system(size: 11))
                        }
                    }
                }
                .foregroundStyle(selected == .a ? CustomColor : CustomColor.opacity(0.8))
                Spacer()
                Button {
                    selected = .b
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: "figure.run")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                        if selected == .b {
                            Text("View B")
                                .font(.system(size: 11))
                        }
                    }
                }
                .foregroundStyle(selected == .b ? CustomColor : CustomColor.opacity(0.8))
                Spacer()
                Button {
                    selected = .c
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                        if selected == .c {
                            Text("View C")
                                .font(.system(size: 11))
                        }
                    }
                }
                .foregroundStyle(selected == .c ? CustomColor : CustomColor.opacity(0.8))
                Spacer()
            }
            .padding()
            .frame(height: 72)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
            }
            .padding(.horizontal)
        }
    }

    struct AView: View {
        var body: some View {
            Text("View A")
        }
    }

    struct BView: View {
        var body: some View {
            Text("View B")
        }
    }

    struct CView: View {
        var body: some View {
            Text("View C")
        }
}

#Preview {
    TabBar()
}
