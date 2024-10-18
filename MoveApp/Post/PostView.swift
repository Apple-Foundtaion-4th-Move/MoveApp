//
//  SwiftUIView.swift
//  MountainApp
//
//  Created by Foundation on 10/14/24.
//

import SwiftUI

struct Meeting: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let members: String
}

struct PostView: View {
    @State private var searchText: String = ""
    @FocusState private var isTextFieldFocused: Bool // 키보드 상태
    
    @State private var meetings = [
        Meeting(title: "영일대 석양 러닝", location: "포항시", time: "11.2(토) 오후 1:30", members: "3/8"),
        Meeting(title: "소통하며 러닝해요", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        Meeting(title: "마라톤 준비 러닝", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8")
    ]
    
    
    var filteredMeetings: [Meeting] {
        if searchText.isEmpty {
            return meetings
        } else {
            return meetings.filter { $0.title.contains(searchText) }
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
                    ForEach(filteredMeetings) { meeting in
                        NavigationLink(destination: PostDetailView(meeting: meeting)) {
                            VStack(alignment: .leading) {
                                Text(meeting.title)
                                    .font(.title2)
                                HStack {
                                    Image(systemName: "location.circle.fill")
                                    Text(meeting.location)
                                    Spacer()
                                    Image(systemName: "calendar.circle.fill")
                                    Text(meeting.time)
                                    Spacer()
                                    HStack {
                                        Image(systemName: "person.3")
                                        Text(meeting.members)
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
