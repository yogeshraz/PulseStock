//
//  PulseStockApp.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

@main
struct PulseStockApp: App {

    @StateObject private var router = NavigationStore<AppRoute>()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(router)
        }
    }
}
