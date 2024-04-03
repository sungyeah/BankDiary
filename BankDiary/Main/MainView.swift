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
    
    
    var body: some View {
        ZStack {
            VStack {
                titileView
                ScrollView() {
                    assetView
                }
            }.navigationBarTitle(Text("Bank Diary"), displayMode: .inline)
        }.background(Color.background)
    }
    
    var titileView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Bank Diary").font(.largeTitle).foregroundColor(.point).bold()
                Spacer()
            }
            .padding(.horizontal, 15).padding(.vertical, 10.0)
        }.background(Color.background)
    }
    
    var assetView: some View {
        VStack(alignment: .leading) {
            Text("자산 현황").font(.title2).bold().padding(.bottom, 0)
            ForEach(data, id: \.self) { asset in
                HStack {
                    Image(asset.image).resizable().scaledToFit()
                    VStack(alignment: .leading) {
                        Text(asset.accountName).font(.footnote).foregroundColor(Color("textColor"))
                        Text("\(asset.amount)원").font(.headline).fontWeight(.bold)
                    }.frame(width: 260,alignment: .leading).padding(.leading, 5)
                }.frame(width: 320).padding(.vertical,7)
            }
        }.padding(20).background().cornerRadius(20)
    }
    
//    var calenderView: some View {
//        
//    }
}


#Preview {
    MainView()
}
