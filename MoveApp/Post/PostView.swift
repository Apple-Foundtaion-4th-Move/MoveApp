//
//  SwiftUIView.swift
//  MountainApp
//
//  Created by Foundation on 10/14/24.
//

import SwiftUI

struct PostInfo: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let members: String
}

struct PostView: View {
    @ObservedObject var postManager = PostManager()
    @State private var searchText: String = ""
    @FocusState private var isTextFieldFocused: Bool // 키보드 상태
    
    var filteredMeetings: [PostInfo] {
        if searchText.isEmpty {
            return postManager.posts
        } else {
            return postManager.posts.filter { $0.title.contains(searchText) || $0.location.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("모임 탐색")
                        .font(.largeTitle.bold())
                        .padding(.vertical)
                    Spacer()
                    NavigationLink(destination: PostCreatView()) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                }
                .padding(.horizontal)
                
                // 상단 검색창
                HStack {
                    TextField("검색어", text: $searchText, prompt: Text("검색어를 입력하세요.")
                        .foregroundColor(.black))
                        .submitLabel(.search)  //  "검색" 버튼
                        .autocorrectionDisabled(true)
                    Image(systemName: "magnifyingglass")
                }
                .onAppear(perform: UIApplication.shared.hideKeyboard)
                .scrollDismissesKeyboard(.immediately)
                .padding(.horizontal, 10)
                .frame(width: 360, height: 50)
                .background(.cyan.opacity(0.1))
                .cornerRadius(12)
                    
                
                // 모임 리스트
                
                List {
                    ForEach(filteredMeetings) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.title2)
                                HStack {
                                    Image(systemName: "location.circle.fill")
                                    Text(post.location)
                                    Spacer()
                                    Image(systemName: "calendar.circle.fill")
                                    Text(post.time)
                                    Spacer()
                                    HStack {
                                        Image(systemName: "person.3")
                                        Text(post.members)
                                    }
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

// 텍스트 필드 편집이 끝났을 때 키보드 내리기 위한 View extension
extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil , from: nil, for: nil
        )
    }
}


struct MeetingListView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
