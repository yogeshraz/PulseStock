//
//  AppRootView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct AppRootView: View {
    
    @StateObject private var router = NavigationStore<AppRoute>()
    @StateObject private var viewModel =
    FeedViewModel(service: StockWebSocketService())
    
    var body: some View {
        
        AppCoordinator()
            .environmentObject(router)
            .environmentObject(viewModel)
            .onOpenURL { url in
                handleDeepLink(url)
            }
    }
    
    private func handleDeepLink(_ url: URL) {
        
        guard url.scheme == "stocks" else { return }
        
        let components = url.pathComponents
        
        if components.count > 1 {
            
            let symbol = components[1]
            
            router.push(.symbolDetail(symbol: symbol))
        }
    }
}
