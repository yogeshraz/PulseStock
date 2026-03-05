//
//  FeedRowView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct FeedRowView: View {

    let stock: Stock

    var body: some View {

        HStack {

            Text(stock.symbol)
                .font(.headline)

            Spacer()

            VStack(alignment: .trailing) {

                Text(String(format: "%.2f", stock.price))

                Image(systemName: stock.isPositive ? "arrow.up" : "arrow.down")
                    .foregroundColor(stock.isPositive ? .green : .red)
            }
        }
        .padding(8)
        .background(
            stock.flashColor == .green ? Color.green.opacity(0.3) :
            stock.flashColor == .red ? Color.red.opacity(0.3) : Color.clear
        )
        .animation(.easeInOut(duration: 0.3), value: stock.flashColor)
    }
}
