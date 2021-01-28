//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

// represents the entire screen
class StockListViewModel: ObservableObject {
    
    // get all stocks
    func getAllStocks() {
        
    }
}

// represents individual stock displayed on the screen

struct StockViewModel {
    
    let stock: Stock
    let id: UUID = UUID() 
    
    var symbol: String {
        stock.symbol
    }
    
    var title: String {
        stock.title
    }
    
    var price: Double {
        stock.price
    }
    
    var quantity: Int {
        stock.quantity
    }
    
    var marketValue: Double {
        return Double(quantity) * price
    }
    
}
