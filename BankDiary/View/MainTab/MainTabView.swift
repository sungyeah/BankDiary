//
//  MainTabView.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/22/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        ZStack {
            Spacer()
            TabView(selection: $selectedTab) {
                Group {
                    HomeView()
                        .tag(MainTabType.home)
                    DiaryView()
                        .tag(MainTabType.diary)
                    CashBookView()
                        .tag(MainTabType.cashBook)
                    MyPageView()
                        .tag(MainTabType.myPage)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            VStack {
                Spacer()
                tabBar
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    var tabBar: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                ForEach(MainTabType.allCases, id: \.self) { tab in
                    Spacer()
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(alignment: .center) {
                            Image(systemName: tab.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            Text(tab.title).font(.caption)
                        }
                    }
                    .foregroundStyle(selectedTab == tab ? Color.black : Color.gray)
                    .padding(.bottom, 10) // "마이" 버튼의 bottom padding 조절
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 16)
            .frame(height: 80)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            //            .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
        )
    }
}

#Preview {
    MainTabView()
}
