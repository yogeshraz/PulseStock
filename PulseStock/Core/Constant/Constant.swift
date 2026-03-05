//
//  Constant.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import Foundation

struct Constants {
    
    static let socketURL = "wss://ws.postman-echo.com/raw"
    
    static let updateInterval: TimeInterval = 2
    
    static let stockSymbols: [String] = [
        "AAPL","GOOG","TSLA","AMZN","MSFT",
        "NVDA","META","NFLX","INTC","AMD",
        "BABA","ORCL","IBM","ADBE","CRM",
        "UBER","LYFT","SHOP","SQ","TWTR",
        "SONY","SAP","V","MA","PYPL"
    ]
    
    static let symbolDescriptions: [String: String] = [
        "AAPL": "Apple Inc. designs and sells consumer electronics, software, and services.",
        "GOOG": "Alphabet Inc. provides internet search, advertising, and cloud computing products.",
        "TSLA": "Tesla, Inc. designs electric vehicles and clean energy solutions.",
        "AMZN": "Amazon.com, Inc. operates e-commerce, cloud, and logistics platforms worldwide.",
        "MSFT": "Microsoft Corporation builds software, cloud services, and enterprise platforms.",
        "NVDA": "NVIDIA Corporation develops GPUs and accelerated computing platforms.",
        "META": "Meta Platforms, Inc. develops social media and immersive technology products.",
        "NFLX": "Netflix, Inc. provides streaming entertainment services globally.",
        "AMD": "Advanced Micro Devices, Inc. designs CPUs and GPUs for consumer and enterprise markets.",
        "INTC": "Intel Corporation develops semiconductor products and computing technologies.",
        "ORCL": "Oracle Corporation provides enterprise software, cloud infrastructure, and database solutions.",
        "IBM": "International Business Machines Corporation offers enterprise hardware, software, and consulting.",
        "UBER": "Uber Technologies, Inc. operates mobility and delivery platforms.",
        "SHOP": "Shopify Inc. provides commerce software and services for online merchants.",
        "BABA": "Alibaba Group Holding Limited provides e-commerce and cloud services.",
        "CRM": "Salesforce, Inc. provides cloud-based CRM and business software solutions.",
        "ADBE": "Adobe Inc. develops creative, document, and digital experience software.",
        "PYPL": "PayPal Holdings, Inc. offers digital payments and commerce technologies.",
        "SQ": "Block, Inc. provides payment, commerce, and financial tools.",
        "SNOW": "Snowflake Inc. provides cloud-based data storage and analytics solutions.",
        "PLTR": "Palantir Technologies Inc. builds data integration and analytics software.",
        "JPM": "JPMorgan Chase & Co. provides banking and financial services.",
        "BAC": "Bank of America Corporation provides banking and financial products.",
        "DIS": "The Walt Disney Company creates entertainment and media experiences.",
        "SONY": "Sony Group Corporation builds entertainment, electronics, and gaming products."
    ]
}
