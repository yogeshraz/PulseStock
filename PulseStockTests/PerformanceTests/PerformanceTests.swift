//
//  PerformanceTests.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import XCTest
@testable import PulseStock

final class PerformanceTests: XCTestCase {

    func testStockPriceUpdatePerformance() {

        measure {

            for _ in 0..<1000 {

                var stock = Stock(symbol: "AAPL", price: 100)

                stock.updatePrice(Double.random(in: 90...110))
            }
        }
    }
}
