//
//  StockWebSocketService.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation
import Combine

final class StockWebSocketService: ObservableObject, StockWebSocketServiceProtocol {
    
    private let socketClient = WebSocketClient()
    
    private var timer: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var stocks: [Stock] = []
    @Published var isConnected: Bool = false
    
    var stocksPublisher: Published<[Stock]>.Publisher { $stocks }
    var connectionPublisher: Published<Bool>.Publisher { $isConnected }
    
    init() {
        setupStocks()
        bindSocket()
    }
    
    private func setupStocks() {
        
        stocks = Constants.stockSymbols.map {
            Stock(symbol: $0, price: PriceGenerator.generate(), previousPrice: 0)
        }
    }
    
    private func bindSocket() {
        
        socketClient.publisher
            .sink { [weak self] text in
                self?.handleMessage(text)
            }
            .store(in: &cancellables)
    }
    
    func start() {
        
        socketClient.connect()
        isConnected = true
        
        timer = Timer.publish(every: Constants.updateInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.sendRandomUpdates()
            }
    }
    
    func stop() {
        
        timer?.cancel()
        socketClient.disconnect()
        isConnected = false
    }
    
    private func sendRandomUpdates() {
        
        for stock in stocks {
            
            let newPrice = PriceGenerator.generate()
            
            let message = "\(stock.symbol):\(newPrice)"
            
            socketClient.send(message)
        }
    }
    
    private func handleMessage(_ message: String) {
        
        let parts = message.split(separator: ":")
        
        guard parts.count == 2,
              let price = Double(parts[1])
        else { return }
        
        let symbol = String(parts[0])
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if let index = self.stocks.firstIndex(where: { $0.symbol == symbol }) {
                
                var stock = self.stocks[index]
                
                stock.previousPrice = stock.price
                stock.price = price
                
                self.stocks[index] = stock
                
                self.sortStocks()
            }
        }
    }
    
    private func sortStocks() {
        stocks.sort { $0.price > $1.price }
    }
}
