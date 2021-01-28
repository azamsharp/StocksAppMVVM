//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    var portfolioBalance: Double {
        return stocks.reduce(0.0, {$0 + $1.marketValue})
    }
    
    var hasBalance: Bool {
        return portfolioBalance > 0
    }
    
    func getAllStocks() {
        
        Webservice().getAllStocks(url: Constants.Urls.getAllStocks) { [weak self] result in
            switch result {
                case .success(let stocks):
                    
                    if let stocks = stocks {
                        self?.stocks = stocks.map(StockViewModel.init)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
}

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
