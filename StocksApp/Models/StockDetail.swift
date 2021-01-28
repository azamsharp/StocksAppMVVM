//
//  StockDetail.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import Foundation

struct StockDetailResponse: Decodable {
    let articles: [StockArticle]
}

struct StockArticle: Decodable {
    let author: String
    let title: String
    let description: String
}
