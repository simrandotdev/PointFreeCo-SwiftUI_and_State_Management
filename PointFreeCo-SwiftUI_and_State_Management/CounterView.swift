//
//  CounterView.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var state: AppState
    
    @State var showModal = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button("-", action: decrementCount)
                Text("\(state.count)")
                Button("+", action: incrementCount)
            }
            
            Button("Is this prime?") {showModal.toggle()  }
            Button("What is the \(state.count) prime?") {
                WolframAlphaResult.nthPrime(state.count) { value in
                    print(✅ "\(state.count) Prime is: \(value ?? 0)")
                }
            }
        }
        .navigationTitle("Counter Demo")
        .sheet(isPresented: $showModal) {
            IsThisPrimeView(appState: state)
        }
        
    }
    
    func incrementCount() {
        state.count += 1
    }
    
    func decrementCount() {
        state.count -= 1
        if state.count < 0 {
            state.count = 0
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
