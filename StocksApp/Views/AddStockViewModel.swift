//
//  AddStockViewModel.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

class AddStockViewModelView: ObservableObject {
    
    func addStock(title: String, symbol: String, price: Double, quantity: Int) {
        
        let stock = Stock(symbol: symbol, title: title, price: price, quantity: quantity)
        
        Webservice().saveStock(url: "https://endurable-bead-polo.glitch.me", stock: stock) { result in
            switch result {
                case .success(()):
                    print("success")
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}
