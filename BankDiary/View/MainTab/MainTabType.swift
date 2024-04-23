//
//  MainTabType.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/22/24.
//

import Foundation

enum MainTabType: String, CaseIterable {
    case home
    case diary
    case cashBook
    case myPage
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .diary:
            return "다이어리"
        case .cashBook:
            return "가계부"
        case .myPage:
            return "마이페이지"
        }
    }
    
    var imageName: String {
        switch self {
        case .home: 
            return "1.square.fill"
        case .diary: 
            return "2.square.fill"
        case .cashBook: 
            return "3.square.fill"
        case .myPage: 
            return "4.square.fill"
        }
    }
}
