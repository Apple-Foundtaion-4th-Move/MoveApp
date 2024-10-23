//
//  Chat.swift
//  MoveApp
//
//  Created by Muchan Kim on 10/24/24.
//

import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let title: String  // 채팅방 이름
    let lastMessage: String  // 마지막 메시지
    let time: String  // 마지막 메시지 시간
    let members: String  // 채팅방 인원 수
    let imageName: String  // 채팅방에 표시할 이미지 이름
}
