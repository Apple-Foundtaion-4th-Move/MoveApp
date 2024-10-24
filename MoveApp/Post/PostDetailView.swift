//
//  모임 글 상세 페이지
//  10.16  파일명 변경 MeetingDetailView -> PostDetailView
//
//  Created by Foundation on 10/15/24.
//

import SwiftUI

struct Participant: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let image: String // 이미지 이름
}



struct PostDetailView: View {
    let post: PostInfo
    let participants: [Participant] = [
        Participant(name: "Moo", message: "오늘도 즐겁게!", image: "Profile1"),
        Participant(name: "비니", message: "함께 뛰어요!", image: "Profile2"),
        Participant(name: "세부", message: "좋은 시간 보내요~", image: "Profile3"),
        Participant(name: "오스틴", message: "힘내세요!", image: "Profile4")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("map")
                .resizable()
                .frame(width: 380, height: 200)
                .cornerRadius(15)
            
            HStack {
                TagView(text: post.location)
            }
            
            // 모임 제목
            Text(post.title)
                .font(.title)
            HStack(alignment: .center) {
                Image(systemName: "location.square.fill")
                    .foregroundStyle(CustomColor)
                Text(post.location)
                Image(systemName: "calendar.circle.fill")
                    .foregroundStyle(CustomColor)
                Text(post.time)
                Image(systemName: "person.2.circle.fill")
                    .foregroundStyle(CustomColor)
                Text("현재 인원: \(post.members)")
            }
            .font(.footnote)
            // 상세설명 박스
            Text("상세 설명")
                .font(.title2)
                .padding(.vertical, 10)
            
            Text(post.text)
                .multilineTextAlignment(.leading)
                .lineLimit(nil) // 줄 수 제한 (UIKit과 다르게 옵셔널로 되어 있어 nil일 때 제한 없음
                .padding()
            // .frame(width: 380, height: 200) // 텍스트뷰 자체 크기 설정
                .background(CustomColor.opacity(0.03)) // 텍스트뷰 배경색 지정
                .cornerRadius(10) // 텍스트뷰 라운드 설정
            
            Text("참여자")
                .font(.title2)
                .padding(.vertical, 10)
            
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text("참가자 목록")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(participants) { participant in
                                VStack {
                                    Image(participant.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(CustomColor.opacity(0.5), lineWidth: 1))
                                    Text(participant.name)
                                        .font(.subheadline)
                                        .bold()
                                    Text(participant.message)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .frame(height: geometry.size.height / 3) // 화면의 1/3 차지
                .background(CustomColor.opacity(0.1))
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .frame(height: UIScreen.main.bounds.height / 3) // 기기 화면 높이의 1/3
        }
        .padding()
    }
}
    
struct TagView: View {
    let text: String
        
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}
    
struct MeetingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

