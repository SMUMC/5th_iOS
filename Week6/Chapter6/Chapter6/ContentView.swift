//
//  ContentView.swift
//  Chapter6
//
//  Created by 김영준 on 2023/11/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mint)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .overlay(
                            Text("우리집")
                                .foregroundStyle(Color.white)
                                .bold()
                        )
                }
                
                
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .stroke(
                            LinearGradient(gradient: Gradient(colors: [.mint, .blue, .purple]), startPoint: .leading, endPoint: .trailing),
                            lineWidth: 1
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .overlay(
                            Text("집콕러세요? ")
                                .foregroundColor(.black) +
                            Text("30% 쿠폰")
                                .bold()
                                .foregroundColor(.black) +
                            Text(" 드려요!")
                                .foregroundColor(.black)
                        )
                    
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
                
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
                            .overlay(
                                HStack {
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("알뜰배달")
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("쿠폰 골라 받기")
                                            .font(.system(size: 15))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3))
                            .overlay(
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("배달")
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("세상은 넓고")
                                            .font(.system(size: 20))
                                        Text("맛집은 많다")
                                            .font(.system(size: 20))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                            .overlay(
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("배민스토어")
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("배달은 지금")
                                            .font(.system(size: 20))
                                        Text("옵니다")
                                            .font(.system(size: 20))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .overlay(
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack {
                                        Text("대용량특가")
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("많이 살수록 더 저렴하죠")
                                            .font(.system(size: 15))
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }
                        )
                    
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .overlay(
                            Image("Image") // 이미지 이름을 적절하게 변경해야 합니다.
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        )
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            }
        }
    }
}

#Preview {
    ContentView()
}
