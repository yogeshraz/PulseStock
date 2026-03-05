//
//  AppRoute.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation

public enum AppRoute: Hashable, Codable, Identifiable {

    case feed
    case symbolDetail(symbol: String)

    public var id: String {
        switch self {
        case .feed:
            return "feed"

        case .symbolDetail(let symbol):
            return "symbolDetail_\(symbol)"
        }
    }
}
