//
//  AssetDetailView.swift
//  BankDiary
//
//  Created by GoldenPlanet on 4/23/24.
//

import SwiftUI

struct AssetDetailView: View {
    @Binding var asset: Asset
    
    var body: some View {
        VStack {
            Text(asset.bank)
            Text(asset.accountName)
            Text("\(asset.amount)")
        }
    }
}

//#Preview {
//    AssetDetailView()
//}
