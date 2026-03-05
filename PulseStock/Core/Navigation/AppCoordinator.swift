//
//  AppCoordinator.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct AppCoordinator: View {
    
    @EnvironmentObject var router: NavigationStore<AppRoute>
    @EnvironmentObject var viewModel: FeedViewModel
    
    var body: some View {
        
        NavigationStack(path: $router.path) {
            
            FeedView(viewModel: viewModel)
            
                .navigationDestination(for: AppRoute.self) { route in
                    
                    switch route {
                        
                    case .feed:
                        
                        FeedView(viewModel: viewModel)
                        
                    case .symbolDetail(let symbol):
                        
                        StockDetailView(symbol: symbol)
                    }
                }
        }
    }
}
