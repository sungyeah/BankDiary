//
//  MainView.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/2/24.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @State var data: [Asset] = [
        Asset(bank: "우리", accountName: "WON 통장", amount: 450000, image: "woori"),
        Asset(bank: "농협", accountName: "NH주거리우대통장", amount: 638530, image: "nh"),
        Asset(bank: "국민", accountName: "KB나라사랑우대통장", amount: 33500, image: "kb"),
        Asset(bank: "토스뱅크", accountName: "토스뱅크통장", amount: 12500, image: "toss"),
        Asset(bank: "카카오뱅크", accountName: "카카오뱅크통장", amount: 1650, image: "kakao")
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    HStack {
                        Text("Bank Diary")
                            .padding(.vertical, 10)
                            .font(.largeTitle)
                            .foregroundColor(.point)
                            .bold()
                        Spacer()
                    }
                    assetView
                    calendarView
                    Spacer()
                }
            }
            .padding(.horizontal, 15)
            .background(Color("backgroundColor"))
        }
    }
    
    var assetView: some View {
        VStack {
            ForEach($data, id: \.self) { $asset in
                Button {
                    path.append("DetailView")
                } label: {
                    HStack {
                        Image(asset.image).resizable()
                            .frame(width: 46, height: 46)
                            .scaledToFit()
                        VStack(alignment: .leading) {
                            Text(asset.accountName)
                                .font(.subheadline).foregroundColor(Color("txtBlackMediumColor"))
                            Spacer()
                                .frame(height: 5)
                            Text("\(asset.amount)원")
                                .font(.system(size: 17, weight: .semibold)).foregroundStyle(Color("txtAmountColor"))
                        }
                        Spacer()
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                }
                .navigationDestination(for: String.self) { view in
                    if view == "DetailView" {
                        AssetDetailView(asset: $asset)
                    }
                }
                .buttonStyle(PressBindableButtonStyle())
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
//        .border(Color.black)
        .background(.white)
        .cornerRadius(10)
    }
    
    var calendarView: some View {
        VStack {
            Text("캘린더 뷰 입니다")
        }
    }
}

private struct PressBindableButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .background(configuration.isPressed ? Color("frameGrayStrongColor") : .white)
            .cornerRadius(10)
    }
}

#Preview {
    HomeView()
}
