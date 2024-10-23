//
//  SwiftUIView.swift
//  MoveApp
//
//  Created by Foundation on 10/17/24.
//

import SwiftUI

struct ChatView: View {
    @State private var searchText: String = "" // 검색어를 저장하는 상태 변수
    
    // 더미 데이터로 채팅 목록
    @State private var chats = [
        Chat(title: "런닝 크루 A", lastMessage: "다들 모임 시간 확인 부탁드려요!", time: "오후 1:30", members: "8", imageName: "러닝크루채팅"),
        Chat(title: "트레일 러닝 준비", lastMessage: "내일 날씨 좋으면 갈까요?", time: "오후 12:10", members: "5", imageName: "트레일채팅"),
        Chat(title: "한강 러닝", lastMessage: "한강 노을 좋아요!!", time: "어제", members: "12", imageName: "한강러닝채팅"),
        Chat(title: "영일대 러닝", lastMessage: "저희 내일 오후 3시에 만나요", time: "2일 전", members: "6", imageName: "영일대채팅"),
    ]
    
    // 검색어에 따라 필터링된 채팅 리스트 반환
    var filteredChats: [Chat] {
        if searchText.isEmpty {
            return chats
        } else {
            return chats.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                // "채팅" 제목
                HStack {
                    Text("모임 탐색")
                        .font(.largeTitle.bold())
                        .padding(.vertical)
                    Spacer()
                }
                
                .padding(.horizontal)
                // 검색창
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
                .frame(width: 360, height: 50)
                .background(.gray.opacity(0.1))
                .cornerRadius(12)
                                
                // 채팅방 리스트
                List {
                    ForEach(filteredChats) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(chat.title)
                                        .font(.title2)
                                    Text(chat.members)
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                }
                                
                                HStack {
                                    Text(chat.lastMessage)
                                    Spacer()
                                    Text(chat.time)
                    
                                }
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            } // VStack 전체
        } // NavigationView 전체
    } // var body 전체
}

// 미리보기 구조체, Xcode에서 SwiftUI 뷰를 실시간으로 미리보기 위한 코드
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView() // ChatView 뷰의 미리보기 설정
    }
}
