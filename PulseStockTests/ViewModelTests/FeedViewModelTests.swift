//
//  FeedViewModelTests.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import XCTest
@testable import PulseStock

final class FeedViewModelTests: XCTestCase {

    var viewModel: FeedViewModel!
    var mockService: MockStockWebSocketService!

    override func setUp() {
        super.setUp()

        mockService = MockStockWebSocketService()
        viewModel = FeedViewModel(service: mockService)
    }

    func testToggleFeed_StartsFeed() {

        viewModel.toggleFeed()

        XCTAssertTrue(mockService.didStart)
        XCTAssertTrue(mockService.isConnected)
    }

    func testToggleFeed_StopsFeed() {

        mockService.isConnected = true
        viewModel.isConnected = true

        viewModel.toggleFeed()

        XCTAssertTrue(mockService.didStop)
        XCTAssertFalse(mockService.isConnected)
    }
}
