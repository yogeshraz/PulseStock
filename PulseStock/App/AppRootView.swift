//
//  AppRootView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI


import SwiftUI

struct AppRootView: View {

    @StateObject private var router = NavigationStore<AppRoute>()
    @StateObject private var viewModel =
        FeedViewModel(service: StockWebSocketService())

    var body: some View {

        AppCoordinator()
            .environmentObject(router)
            .environmentObject(viewModel)
    }
}
