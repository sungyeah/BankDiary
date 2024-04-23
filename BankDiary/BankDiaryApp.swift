//
//  BankDiaryApp.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/1/24.
//

import SwiftUI

@main
struct BankDiaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
