//
//  ContentView.swift
//  Chapter7
//
//  Created by 김영준 on 2023/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("광명동")
                    .font(.system(size: 20, weight: .bold))
                    .frame(alignment: .leading)
                Image(systemName: "chevron.down")
                Spacer()
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 24, height: 18)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
        }
        .padding()
        ScrollView {
            cardView(imageName: "headphones", title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구합니다.", subtitle: "당근알바 이벤트")
            divider()
            cardView(imageName: "headphones", title: "에어팟 맥스 실버", subtitle: "서울특별시 양천구", price: "370,000원")
            divider()
            cardView(imageName: "headphones", title: "에어팟 맥스 스페이스 그레이 S급 판매합니다.", subtitle: "서울특별시 양천구 3시간 전", price: "490,000원")
            divider()
            cardView(imageName: "headphones", title: "에어팟 맥스 스페이스 그레이 S급 판매합니다.", subtitle: "서울특별시 양천구 3시간 전", price: "490,000원")
            divider()
            cardView(imageName: "headphones", title: "에어팟 맥스 스페이스 그레이 S급 판매합니다.", subtitle: "서울특별시 양천구 3시간 전", price: "490,000원")
            divider()
            cardView(imageName: "headphones", title: "에어팟 맥스 스페이스 그레이 S급 판매합니다.", subtitle: "서울특별시 양천구 3시간 전", price: "490,000원")
            divider()
            
        }
    }
    
    private func cardView(imageName: String, title: String, subtitle: String, price: String? = nil) -> some View {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
                VStack {
                    HStack {
                        Text(title)
                            .font(.system(size: 18))
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 1, leading: 15, bottom: 0, trailing: 5))
                    
                    HStack {
                        Text(subtitle)
                            .font(.system(size: 14, weight: .thin))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 1, leading: 15, bottom: 0, trailing: 5))
                    
                    if let price = price {
                        HStack {
                            Text(price)
                                .font(.system(size: 18, weight: .bold))
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 5))
                    }
                    
                    Spacer()
                }
            }
        }
        
        // Divider View
        private func divider() -> some View {
            Divider()
                .frame(width: 330)
                .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
        }
  
}

#Preview {
    ContentView()
}
