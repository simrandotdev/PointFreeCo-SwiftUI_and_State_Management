//
//  ContentView.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appstate = AppState()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    CounterView(state: appstate)
                } label: {
                    Text("Counter Demo")
                }
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Favorite Primes")
                }
            }
            .navigationTitle("State Management")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
