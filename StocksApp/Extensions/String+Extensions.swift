//
//  String+Extensions.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import Foundation

extension String {
    
    func toDoubleOrDefault(defaultValue: Double = 0.0) -> Double {
       return Double(self) ?? defaultValue
    }
    
    func toIntOrDefault(defaultValue: Int = 0) -> Int {
        return Int(self) ?? defaultValue 
    }
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
}
