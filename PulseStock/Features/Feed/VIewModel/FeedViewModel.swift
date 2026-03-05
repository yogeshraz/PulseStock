//
//  FeedViewModel.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Combine
import SwiftUI

final class FeedViewModel: ObservableObject {

    @Published var stocks: [Stock] = []
    @Published var isConnected: Bool = false

    private let service: StockWebSocketServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(service: StockWebSocketServiceProtocol) {

        self.service = service

        service.stocksPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$stocks)

        service.connectionPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$isConnected)
    }

    func toggleFeed() {

        if isConnected {
            service.stop()
        } else {
            service.start()
        }
    }
}
