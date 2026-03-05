//
//  PriceGenerator.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation

struct PriceGenerator {
    
    static func generate() -> Double {
        Double.random(in: 100...500)
    }
}
