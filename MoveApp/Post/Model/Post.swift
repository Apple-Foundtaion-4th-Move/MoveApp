//
//  PostFilter.swift
//  MoveApp
//
//  Created by Foundation on 10/18/24.
// ObservableObject를 사용하려했으나, 시간 상이유로 state, binding으로 할 예정. 추후 구현 합니다.

import Foundation

class PostManager: ObservableObject {
    @Published var posts: [PostInfo] = [
        PostInfo(title: "영일대 석양 러닝", location: "포항시", time: "11.2(토) 오후 1:30", members: "3/8"),
        PostInfo(title: "소통하며 러닝해요", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        PostInfo(title: "마라톤 준비 러닝", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        PostInfo(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8")
    ]
    
    func addPost(title: String, location: String, time: String, members: String) {
        let newPost = PostInfo(title: title, location: location, time: time, members: members)
        posts.append(newPost)
    }
}
