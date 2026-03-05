//
//  ConstantsTests.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import XCTest
@testable import PulseStock

final class ConstantsTests: XCTestCase {

    func testStockSymbolsNotEmpty() {

        XCTAssertFalse(Constants.stockSymbols.isEmpty)
    }

    func testSymbolDescriptionExists() {

        let description = Constants.symbolDescriptions["AAPL"]

        XCTAssertNotNil(description)
    }

    func testSymbolDescriptionsMatchSymbols() {

        for symbol in Constants.stockSymbols {

            XCTAssertNotNil(Constants.symbolDescriptions[symbol])
        }
    }
}
