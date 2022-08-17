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
    @State var showNthPrimeAlert = false
    @State var nthPrime: Int? = nil
    @State var isLoading = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button("-", action: decrementCount)
                Text("\(state.count)")
                Button("+", action: incrementCount)
            }
            
            Button("Is this prime?") {showModal.toggle()  }
            Button("What is the \(state.count) prime?") {
                isLoading = true
                WolframAlphaResult.nthPrime(state.count) { value in
                    self.showNthPrimeAlert.toggle()
                    self.nthPrime = state.count
                    self.isLoading = false
                }
            }
        }
        .navigationTitle("Counter Demo")
        .overlay(content: {
            if isLoading {
                ProgressView()
            }
        })
        .sheet(isPresented: $showModal) {
            IsThisPrimeView(appState: state)
        }
        .alert("\(state.count) Prime is", isPresented: $showNthPrimeAlert) {
            Text("\(state.count) Prime is: \(nthPrime ?? 0)")
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
