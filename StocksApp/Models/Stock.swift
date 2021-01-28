//
//  Stock.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

struct Stock: Codable {
    
    let symbol: String
    let title: String
    let price: Double
    let quantity: Int
    
}

extension Stock {
    
    static func from(_ vs: AddStockViewState) -> Stock {
        return Stock(symbol: vs.symbol, title: vs.title, price: vs.price.toDoubleOrDefault(), quantity: vs.quantity.toIntOrDefault())
    }
    
}
