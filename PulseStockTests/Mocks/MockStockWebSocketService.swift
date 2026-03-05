//
//  MockStockWebSocketService.swift
//  PulseStockTests
//
//  Created by Yogesh Raj on 05/03/26.
//

import Combine
@testable import PulseStock

final class MockStockWebSocketService: StockWebSocketServiceProtocol {

    @Published var stocks: [Stock] = []
    @Published var isConnected: Bool = false

    var stocksPublisher: Published<[Stock]>.Publisher { $stocks }
    var connectionPublisher: Published<Bool>.Publisher { $isConnected }

    var didStart = false
    var didStop = false

    func start() {
        didStart = true
        isConnected = true
    }

    func stop() {
        didStop = true
        isConnected = false
    }
}
