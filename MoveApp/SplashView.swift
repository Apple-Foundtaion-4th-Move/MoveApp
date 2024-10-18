//
//  SwiftUIView.swift
//  MoveApp
//
//  Created by Foundation on 10/15/24.
//

import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "figure.run") // 로고 이미지 run
                    .resizable() // 이미지 수정 허용
                    .scaledToFit() // 주어진 프레임에 맞게 비율 유지하며 조정
                    .frame(width: 150, height: 150) // 로고 프레임 크기 설정
            }
            // 뷰가 화면에 나타날 때 실행해야 하는 코드
            .onAppear {
                // 2초 후 메인 뷰로 전환
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { withAnimation {
                    isActive = true
                    }
                }
            }
        }
    }
}
    
