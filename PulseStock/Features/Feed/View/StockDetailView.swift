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

    var body: some View {

        VStack(spacing: 20) {

            if let stock = viewModel.stocks.first(where: { $0.symbol == symbol }) {

                Text(stock.symbol)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(String(format: "%.2f", stock.price))
                    .font(.system(size: 40, weight: .bold))
                    .animation(.easeInOut(duration: 0.25), value: stock.price)

                HStack(spacing: 6) {

                    Image(systemName: stock.isPositive ? "arrow.up" : "arrow.down")

                    Text(stock.isPositive ? "Price Increased" : "Price Decreased")
                }
                .foregroundColor(stock.isPositive ? .priceUp : .priceDown)

                Text("This is a demo description for \(stock.symbol) stock.")
                    .padding()
                    .multilineTextAlignment(.center)

            } else {

                ProgressView()
            }
        }
        .padding()
        .navigationTitle(symbol)
    }
}
