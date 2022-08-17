//
//  AppState.swift
//  PointFreeCo-SwiftUI_and_State_Management
//
//  Created by Simran Preet Narang on 2022-08-17.
//

import Foundation
import Combine

class AppState: ObservableObject {
    
    @Published var count: Int = 0 {
        didSet {
            self.didChange.send()
        }
    }
    
    @Published var favoritePrimes: [Int] = [2, 3, 5, 7, 11] {
        didSet { self.didChange.send() }
    }
    
    var didChange = PassthroughSubject<Void, Never>()
    
    
    func isPrime (_ p: Int) -> Bool {
        if p <= 1 { return false }
        if p <= 3 { return true }
        for i in 2...Int(sqrtf(Float(p))) {
            if p % i == 0 { return false }
        }
        return true
    }
    
    func addToFavorites() {
        favoritePrimes.append(count)
    }
    
    func removeFromFavorites() {
        favoritePrimes.removeAll(where: { $0 == count })
    }
}
