//
//  ContentView.swift
//  baemin_swiftUI
//
//  Created by 이현호 on 2023/11/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemGray5).ignoresSafeArea(.all)
            ScrollView{
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mint)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .overlay(
                            Text("우리짐")
                                .foregroundColor(.white)
                                .bold()
                        )
                }
                
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .stroke(
                            LinearGradient(gradient: Gradient(colors: [.mint, .blue, .purple]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .trailing),
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
                                .foregroundStyle(.black)
                        )
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
                
                VStack{
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
                            .overlay(
                                HStack{
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("알뜰배달")
                                            .font(.system(size:20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("쿠폰 골라 받기")
                                            .font(.system(size:15))
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
                            .overlay(
                                HStack{
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("배민스토어")
                                            .font(.system(size:20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("배달은 지금")
                                            .font(.system(size:15))
                                            .foregroundStyle(Color.black)
                                        Text("옵니다")
                                            .font(.system(size:15))
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
                            .overlay(
                                HStack{
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("배달")
                                            .font(.system(size:20))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text("세상은 넓고")
                                            .font(.system(size:15))
                                            .foregroundStyle(Color.black)
                                        Text("맛집은 많다")
                                            .font(.system(size:15))
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                
                ZStack {
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
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    
                                    LazyHGrid(rows: [GridItem(), GridItem()]){
                                        ForEach(1..<11, id: \.self) { _ in
                                            Color(red: 0.8, green: 0.8, blue: 0.8)
                                                .frame(width: 50, height: 50)
                                                .cornerRadius(15)
                                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                                            
                                        }
                                    }
                                }
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
                            Image("saleImage") // 이미지 이름을 적절하게 변경해야 합니다.
                                .resizable()
                                .scaledToFill()
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
