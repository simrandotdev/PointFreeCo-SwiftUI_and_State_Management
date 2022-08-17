//
//  FavoritePrimesView.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import SwiftUI

struct FavoritePrimesView: View {
    
    @ObservedObject var state: AppState
    
    var body: some View {
        List {
            ForEach(state.favoritePrimes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                state.favoritePrimes.remove(atOffsets: indexSet)
            }
        }
        .navigationTitle("Favorite Primes")
    }
}

struct FavoritePrimesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePrimesView(state: AppState())
    }
}
