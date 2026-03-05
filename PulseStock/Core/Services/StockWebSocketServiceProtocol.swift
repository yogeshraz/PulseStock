//
//  StockWebSocketServiceProtocol.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Combine

protocol StockWebSocketServiceProtocol: AnyObject {

    var stocksPublisher: Published<[Stock]>.Publisher { get }
    var connectionPublisher: Published<Bool>.Publisher { get }

    func start()
    func stop()
}
