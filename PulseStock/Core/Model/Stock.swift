//
//  Stock.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation

struct Stock: Identifiable, Codable {

    var id = UUID()

    let symbol: String
    var price: Double
    var previousPrice: Double = 0
    var flashColor: FlashColor?

    var priceChange: Double {
        price - previousPrice
    }

    var isPositive: Bool {
        priceChange >= 0
    }

    mutating func updatePrice(_ newPrice: Double) {
        previousPrice = price
        price = newPrice
    }
}

enum FlashColor: String, Codable {
    case green
    case red
}
