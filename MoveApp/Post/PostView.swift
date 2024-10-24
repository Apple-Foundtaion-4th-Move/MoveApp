//
//  SwiftUIView.swift
//  MountainApp
//
//  Created by Foundation on 10/14/24.
//

import SwiftUI

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
                    NavigationLink(destination: PostCreatView(postManager: postManager)) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(CustomColor)
                    }
                }
                .padding(.horizontal)
                
                // 상단 검색창
                HStack {
                    TextField("검색어", text: $searchText, prompt: Text("제목, 키워드로 검색해봐요.")
                        .foregroundColor(.gray))
                        .submitLabel(.search)  //  "검색" 버튼
                        .autocorrectionDisabled(true)
                    Image(systemName: "magnifyingglass")
                }
                .onAppear(perform: UIApplication.shared.hideKeyboard)
                .scrollDismissesKeyboard(.immediately)
                .padding(.horizontal, 10)
                .frame(width: 380, height: 50)
                .background(.gray.opacity(0.1))
                .cornerRadius(12)
                .padding()
                
                // 광고
                Link(destination: URL(string: "https://developeracademy.postech.ac.kr/foundation-program")!) {
                    HStack {
                        Image("Apple_logo")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                        VStack(alignment: .leading) {
                            Text("애플 파운데이션 프로그램 4기 수료 D-1")
                                .font(.headline.bold())
                                .foregroundStyle(.black)
                            Text("회식 가즈아 ~~~!")
                                .font(.caption)
                                .foregroundStyle(.black.opacity(0.6))
                            
                        }
                    }
                    .frame(width: 370, height: 75)
                    .background(CustomColor.opacity(0.7))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
                // 모임 리스트
                .padding(.bottom, 1)
                
                List {
                    ForEach(filteredMeetings) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            VStack(alignment: .leading) {
                                Text(" " + post.title)
                                    .font(.headline)
                                    .padding(.bottom, 1)
                                HStack {
                                    Image(systemName: "location.circle.fill")
                                        .foregroundColor(CustomColor)
                                    Text(post.location)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Image(systemName: "calendar.circle.fill")
                                        .foregroundColor(CustomColor)
                                    Text(post.time)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    HStack {
                                        Image(systemName: "person.3")
                                            .foregroundColor(CustomColor)
                                        Text(post.members)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .font(.subheadline)
                                .padding(.vertical, 3)
                            }
                            .padding(.horizontal, 1)
                            .background(CustomColor.opacity(0.03))
                            .cornerRadius(10)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 1)
                        .shadow(radius: 0.1)
                        
                    }
                }
                .listStyle(PlainListStyle())
            }
            .background(CustomColor.opacity(0.03))

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
