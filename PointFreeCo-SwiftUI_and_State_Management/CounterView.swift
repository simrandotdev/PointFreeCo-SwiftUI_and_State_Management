//
//  CounterView.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var state: AppState
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button("-", action: decrementCount)
                Text("\(state.count)")
                Button("+", action: incrementCount)
            }
            
            Button("Is this prime?") {}
            Button("What is the \(state.count) prime?") {}
        }
        .navigationTitle("Counter Demo")
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


import Combine

class AppState: ObservableObject {
    
    @Published var count: Int = 0 {
        didSet {
            self.didChange.send()
        }
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
