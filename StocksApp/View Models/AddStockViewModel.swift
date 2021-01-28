//
//  AddStockViewModel.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

class AddStockViewModel: ObservableObject {
    
    private func isQuantityValid(quantity: String) -> Bool {
        if !quantity.isEmpty && Int(quantity) != nil {
            return true
        }
        return false
    }
    
    private func isPriceValid(price: String) -> Bool {
        if !price.isEmpty && Double(price) != nil {
            return true
        }
        
        return false
    }
    
    private func validate(_ vs: AddStockViewState) -> Bool {
        if !vs.title.isEmpty && !vs.symbol.isEmpty && isQuantityValid(quantity: vs.quantity) && isPriceValid(price: vs.price) {
            return true
        }
        return false
    }
    
    func addStock(_ addStockVS: AddStockViewState, completion: @escaping () -> Void) {
        if(validate(addStockVS)) {
            // save the stock 
        }
    }
    
}
