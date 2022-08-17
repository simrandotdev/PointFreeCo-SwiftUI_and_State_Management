//
//  IsThisPrimeView.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import SwiftUI

struct IsThisPrimeView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        
        VStack(spacing: 10) {
            if appState.favoritePrimes.contains(appState.count) {
                Button("Remove from Favorites") {
                    appState.removeFromFavorites()
                }
            } else if appState.isPrime(appState.count)  {
                Button("Add to Favorites") {
                    appState.addToFavorites()
                }
            }
            
            Text(appState.isPrime(appState.count)
                 ? "\(appState.count) is a Prime 😀"
                 : "\(appState.count) is not a Prime 😭")
        }
    }
}

struct IsThisPrimeView_Previews: PreviewProvider {
    static var previews: some View {
        IsThisPrimeView(appState: AppState())
    }
}
