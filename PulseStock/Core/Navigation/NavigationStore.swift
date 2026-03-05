//
//  NavigationStore.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI
import Combine

@MainActor
public final class NavigationStore<Route: Hashable & Codable>: ObservableObject {

    // MARK: - Stack
    @Published public var path: [Route] = []

    // MARK: - Sheet
    @Published public var sheet: Route?

    // MARK: - Full Screen
    @Published public var fullScreen: Route?

    public init() {}
}

public extension NavigationStore {

    func push(_ route: Route) {
        path.append(route)
    }

    func pop(_ count: Int = 1) {
        path.removeLast(min(count, path.count))
    }

    func popToRoot() {
        path.removeAll()
    }

    func replace(with routes: [Route]) {
        path = routes
    }
}

public extension NavigationStore {

    func presentSheet(_ route: Route) {
        sheet = route
    }

    func dismissSheet() {
        sheet = nil
    }
}

public extension NavigationStore {

    func presentFullScreen(_ route: Route) {
        fullScreen = route
    }

    func dismissFullScreen() {
        fullScreen = nil
    }
}
