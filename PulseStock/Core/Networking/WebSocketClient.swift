//
//  WebSocketClient.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation
import Combine

final class WebSocketClient {
    
    private var webSocketTask: URLSessionWebSocketTask?
    
    private let subject = PassthroughSubject<String, Never>()
    
    var publisher: AnyPublisher<String, Never> {
        subject.eraseToAnyPublisher()
    }
    
    func connect() {
        guard let url = URL(string: Constants.socketURL) else { return }
        
        let session = URLSession(configuration: .default)
        
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        
        receive()
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
    }
    
    func send(_ text: String) {
        webSocketTask?.send(.string(text)) { error in
            if let error = error {
                print("Send error:", error)
            }
        }
    }
    
    private func receive() {
        webSocketTask?.receive { [weak self] result in
            
            switch result {
                
            case .failure(let error):
                print("Receive error:", error)
                
            case .success(let message):
                
                switch message {
                    
                case .string(let text):
                    self?.subject.send(text)
                    
                default:
                    break
                }
            }
            
            self?.receive()
        }
    }
}
