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
        
        Webservice().getStockArticlesByTitle(url: Constants.Urls.getStockDetailByTitle(title: title)) { result in
            switch result {
                case .success(let articles):
                    DispatchQueue.main.async { [weak self] in
                        self?.stockArticles = articles.map(StockArticleViewModel.init)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
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


