//
//  Constants.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import Foundation

struct Constants {
    
    private static let baseURL = "https://endurable-bead-polo.glitch.me"
    
    struct Urls {
        static let getAllStocks = "\(baseURL)/stocks"
        static let addNewStock = "\(baseURL)/stocks"
        
        static func getStockDetailByTitle(title: String) -> String {
            return "http://newsapi.org/v2/everything?q=\(title.escaped())&apiKey=0cf790498275413a9247f8b94b3843fd"
        }
    }
    
}
