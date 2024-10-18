//
//  모임 글 상세 페이지
//  10.16  파일명 변경 MeetingDetailView -> PostDetailView
//
//  Created by Foundation on 10/15/24.
//

import SwiftUI

struct PostDetailView: View {
    let meeting: Meeting
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("map")
                    .resizable()
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
                
                HStack {
                    TagView(text: meeting.location)
                }
                
                // 모임 제목
                Text(meeting.title)
                    .font(.title)
                HStack {
                    Image(systemName: "location.square.fill")
                    Text(meeting.location)
                    Image(systemName: "calendar.circle.fill")
                    Text(meeting.time)
                    Image(systemName: "person.2.circle.fill")
                    Text("현재 인원: \(meeting.members)")
                }
                .font(.footnote)
                
                // 상세설명 박스
                Text("상세 설명")
                    .font(.title2)
                    .padding(.vertical, 10)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 350,height: 200)
                
                Text("참가 인원")
                    .font(.title2)
                    .padding(.vertical, 10)
            }
        }
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
