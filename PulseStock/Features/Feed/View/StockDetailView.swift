//
//  StockDetailView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct StockDetailView: View {
    
    let symbol: String
    @EnvironmentObject var viewModel: FeedViewModel
    
    private var description: String {
        Constants.symbolDescriptions[symbol] ?? "No description available."
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 24) {
                
                if let stock = viewModel.stocks.first(where: { $0.symbol == symbol }) {
                    
                    // SYMBOL
                    Text(stock.symbol)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // PRICE
                    Text(String(format: "%.2f", stock.price))
                        .font(.system(size: 46, weight: .bold))
                        .foregroundColor(stock.isPositive ? .green : .red)
                        .animation(.easeInOut(duration: 0.25), value: stock.price)
                    
                    // PRICE STATUS
                    HStack(spacing: 6) {
                        
                        Image(systemName: stock.isPositive ? "arrow.up.right" : "arrow.down.right")
                        
                        Text(stock.isPositive ? "Price Increased" : "Price Decreased")
                    }
                    .font(.headline)
                    .foregroundColor(stock.isPositive ? .green : .red)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("About \(symbol)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Live market data streaming via WebSocket.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                } else {
                    
                    ProgressView()
                }
            }
            .padding()
        }
        .navigationTitle(symbol)
        .navigationBarTitleDisplayMode(.inline)
    }
}
