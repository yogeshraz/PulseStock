//
//  Constant.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation

struct Constants {
    
    static let socketURL = "wss://ws.postman-echo.com/raw"
    
    static let stockSymbols: [String] = [
        "AAPL","GOOG","TSLA","AMZN","MSFT",
        "NVDA","META","NFLX","INTC","AMD",
        "BABA","ORCL","IBM","ADBE","CRM",
        "UBER","LYFT","SHOP","SQ","TWTR",
        "SONY","SAP","V","MA","PYPL"
    ]
    
    static let updateInterval: TimeInterval = 2
}
