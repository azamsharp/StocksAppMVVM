//
//  StockDetailsView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import SwiftUI

struct StockArticleListView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        Text(stock.title)
        
        .navigationTitle(stock.title)
    }
}

struct StockDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "MSFT", title: "Microsoft", price: 250, quantity: 100)
        let stockVM = StockViewModel(stock: stock)
        
        StockArticleListView(stock: stockVM)
            .embedInNavigationView()
    }
}
