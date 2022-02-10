//
//  StockDetailViewModel .swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import Foundation

class StockArticleListViewModel: ObservableObject {
    
    @Published var stockArticles: [StockArticleViewModel] = [StockArticleViewModel]()
    
    func getStockArticlesByTitle(title: String) {
        
        // get all articles by title 
    }
}

struct StockArticleViewModel  {
    
    let stockArticle: StockArticle
    let id = UUID() 
    
    var title: String {
        return stockArticle.title
    }
    
    var description: String {
        return stockArticle.description
    }
}


