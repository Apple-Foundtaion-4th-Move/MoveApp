//
//  ChatDetailView.swift
//  MoveApp
//
//  Created by Muchan Kim on 10/24/24.
//

import SwiftUI

// ChatDetailView: 채팅방의 세부 정보를 보여주는 뷰
struct ChatDetailView: View {
    
    // 채팅방 정보(제목, 마지막 메시지, 시간, 인원)를 담고 있는 Chat 구조체의 인스턴스
    let chat: Chat
    @State private var chatText: String = "" // 검색어를 저장하는 상태 변수
    
    var body: some View {
        // 스크롤 가능한 뷰, 내용이 많을 경우 스크롤을 허용
        ZStack {
            Color(red: 171/255, green: 194/255, blue: 209/255)
                .edgesIgnoringSafeArea(.horizontal) // 탭바와 네비게이션 바에 영향을 주지 않도록 설정
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                ScrollView {
                    // 화면을 수직으로 정렬하고 모든 요소를 왼쪽 정렬
                    VStack(alignment: .center) {
                        HStack {
                            // 시간 아이콘과 시간 정보
                            Image(systemName: "calendar.circle.fill")
                            Text("2024년 10월 4일 금요일")
                                .font(.system(size: 14))
                        }
                        .frame(width: 220, height: 25)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        
                        // 채팅방에 따른 이미지
                        Image(chat.imageName)
                            .resizable()
                            .frame(width: 400, height: 500)
                        
                        Spacer() // 스크롤 가능한 내용 아래쪽으로 여백 추가
                        
                    } // 전체 Vstack
                    .padding() // 전체 뷰에 여백 추가
                    
                } // scrollView
                
                // 입력창을 맨 아래에 위치시키기 위한 HStack
                HStack {
                    TextField("메세지", text: $chatText, prompt: Text("메세지를 입력하세요."))
                        .padding(10) // 텍스트 필드 내 여백 추가
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(width: 340, height: 50)
                    
                    Image(systemName: "arrowshape.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
//                        .padding() // 아이콘에 여백 추가
                }
                .padding(.horizontal, 20)
                .padding(.top, 20) // 탭바와 붙어 있도록 하단 패딩 추가
                
            } // VStack
        } // ZStack
        .navigationTitle(chat.title)
        .navigationBarTitleDisplayMode(.inline)
    } // var body
} // struct
