//
//  StockTests.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import XCTest
@testable import PulseStock

final class StockTests: XCTestCase {

    func testStockPriceIncreaseSetsPositive() {

        var stock = Stock(symbol: "AAPL", price: 100, previousPrice: 50)

        stock.updatePrice(110)

        XCTAssertTrue(stock.isPositive)
    }

    func testStockPriceDecreaseSetsNegative() {

        var stock = Stock(symbol: "AAPL", price: 100)

        stock.updatePrice(90)

        XCTAssertFalse(stock.isPositive)
    }
}
