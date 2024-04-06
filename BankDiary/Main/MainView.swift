//
//  MainView.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/2/24.
//

import SwiftUI

struct MainView: View {
    
    struct Asset: Hashable {
        let bank: String
        let accountName: String
        let amount: Int
        let image: String
    }
    
    var data: [Asset] = [
        Asset(bank: "우리", accountName: "WON 통장", amount: 450000, image: "woori"),
        Asset(bank: "농협", accountName: "NH주거리우대통장", amount: 638530, image: "nh"),
        Asset(bank: "국민", accountName: "KB나라사랑우대통장", amount: 33500, image: "kb"),
        Asset(bank: "토스뱅크", accountName: "토스뱅크통장", amount: 12500, image: "toss"),
        Asset(bank: "카카오뱅크", accountName: "카카오뱅크통장", amount: 1650, image: "kakao")
    ]
    
    enum Tab {
        case a, b, c, d
    }
    
    @State private var selected: Tab = .a
    
    var body: some View {
        ZStack {
            Spacer()
            TabView(selection: $selected) {
                Group {
                    NavigationStack {
                        assetView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Bank Diary")
                                    .padding(.vertical, 10)
                                    .font(.largeTitle)
                                    .foregroundColor(.point)
                                    .bold()
                            }
                        }
                    }
                    .tag(Tab.a)
                    Text("다이어리")
                        .tag(Tab.b)
                    Text("가계부")
                        .tag(Tab.c)
                    Text("마이")
                        .tag(Tab.d)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            VStack() {
                Spacer()
                tabBar
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    var assetView: some View {
        List(data, id: \.self) { asset in
            HStack {
                Image(asset.image).resizable().scaledToFit()
                VStack(alignment: .leading) {
                    Text(asset.accountName)
                        .font(.subheadline).foregroundColor(Color("txtBlackMediumColor"))
                    Spacer()
                        .frame(height: 5)
                    Text("\(asset.amount)원")
                        .font(.system(size: 17, weight: .semibold)).foregroundStyle(Color("txtAmountColor"))
                }
                .frame(width: 267,alignment: .leading)
                .padding(.leading, 5)
            }
            .background(NavigationLink("", destination:EmptyView()).opacity(0))
            .listRowSeparator(.hidden)
        }
    }
    
    var tabBar: some View {
        HStack {
            Spacer()
            Button {
                selected = .a
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "1.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    Text("홈")
                }
            }
            .foregroundStyle(selected == .a ? Color.black : Color.gray)
            
            Spacer()
            
            Button {
                selected = .b
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "2.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    Text("다이어리")
                }
            }
            .foregroundStyle(selected == .b ? Color.black : Color.gray)
            
            Spacer()
            
            Button {
                selected = .c
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "3.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    Text("가계부")
                }
            }
            .foregroundStyle(selected == .c ? Color.black : Color.gray)
            
            Spacer()
            
            Button {
                selected = .d
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "4.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    Text("마이")
                }
            }
            .foregroundStyle(selected == .d ? Color.black : Color.gray)
            Spacer()
        }
        .padding()
        .frame(height: 80)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
//                .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
        }
    }
}

#Preview {
    MainView()
}
