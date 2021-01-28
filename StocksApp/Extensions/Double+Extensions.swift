//
//  Double+Extensions.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "" 
    }
    
}
