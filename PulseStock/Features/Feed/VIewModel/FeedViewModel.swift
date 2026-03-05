//
//  FeedViewModel.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation
import Combine

final class FeedViewModel: ObservableObject {
    
    @Published var stocks: [Stock] = []
    
    @Published var isConnected: Bool = false
    
    private let service: StockWebSocketService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: StockWebSocketService) {
        
        self.service = service
        
        bind()
    }
    
    private func bind() {
        
        service.$stocks
            .receive(on: DispatchQueue.main)
            .assign(to: &$stocks)
        
        service.$isConnected
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
