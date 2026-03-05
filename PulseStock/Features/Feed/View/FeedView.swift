//
//  FeedView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct FeedView: View {

    @ObservedObject var viewModel: FeedViewModel
    @EnvironmentObject var router: NavigationStore<AppRoute>

    var body: some View {

        List(viewModel.stocks) { stock in

            Button {

                router.push(.symbolDetail(symbol: stock.symbol))

            } label: {

                FeedRowView(stock: stock)
            }
        }
        .navigationTitle("Stocks")

        .toolbar {

            ToolbarItem(placement: .navigationBarLeading) {

                Circle()
                    .fill(viewModel.isConnected ? .green : .red)
                    .frame(width: 10, height: 10)
            }

            ToolbarItem(placement: .navigationBarTrailing) {

                Button(viewModel.isConnected ? "Stop" : "Start") {
                    viewModel.toggleFeed()
                }
            }
        }
    }
}
