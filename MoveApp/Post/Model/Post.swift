//
//  PostFilter.swift
//  MoveApp
//
//  Created by Foundation on 10/18/24.
// ObservableObject를 사용하려했으나, 시간 상이유로 state, binding으로 할 예정. 추후 구현 합니다.

import Foundation

struct PostInfo: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let members: String
    let text: String
}

func dateFromString(_ time: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd(E) HH:mm" // "11.9(Sat) 1:30" 형식에 맞춤
    formatter.locale = Locale(identifier: "ko_KR") // 한국 로케일 설정 (필요시)
    return formatter.date(from: time)
}

class PostManager: ObservableObject {
    @Published var posts: [PostInfo] = [
        PostInfo(title: "파운데이션 마무리 러닝", location: "Pohang", time: "10.25(Mon) 18:30", members: "3/5", text: "Goodbye foundation"),
        PostInfo(title: "영일대 석양 러닝", location: "Seoul", time: "11.9(Sat) 1:30", members: "3/8", text: "안녕하세요 좋은 저녁 입니다."),
        PostInfo(title: "소통하며 러닝해요", location: "Daegu", time: "11.10(Sun) 7:30", members: "3/8", text: "안녕하세요 좋은 러닝 해요^^"),
        PostInfo(title: "트레일 러닝 갈 사람", location: "Pohang", time: "11.10(Sun) 21:30", members: "4/8", text: "러닝하며 친해져요 ^^"),
        PostInfo(title: "마라톤 준비 러닝", location: "Busan", time: "11.11(Mon) 18:30", members: "3/5", text: "상급자 러닝 모임입니다."),
        PostInfo(title: "아카데미 준비하며 달려요", location: "Seoul", time: "11.14(Thu) 20:30", members: "3/5", text: "아카데미 드가자~~"),
        PostInfo(title: "죽을 각오로 뛰실 분만", location: "Busan", time: "11.15(Fri) 18:30", members: "3/5", text: "레스고돌희")
    ]
    
    func addPost(title: String, location: String, time: String, members: String, text:String) {
        let newPost = PostInfo(title: title, location: location, time: time, members: members, text: text)
        posts.insert(newPost, at: 0)
        
        // 날짜순으로 정렬
        posts.sort { post1, post2 in
            guard let date1 = dateFromString(post1.time),
                  let date2 = dateFromString(post2.time) else {
                return false
            }
            return date1 < date2
        }
        print(newPost, "is added")
    }
}
