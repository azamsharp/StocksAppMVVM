//
//  StockDetailsView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/26/21.
//

import SwiftUI

struct StockArticleListScreen: View {
    
    let stock: StockViewModel
    @StateObject private var stockArticleListVM = StockArticleListViewModel()
    
    var body: some View {
        List(stockArticleListVM.stockArticles, id: \.id) { article in
            VStack(alignment: .leading) {
                Text(article.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text(article.description)

            }
        }
        .navigationTitle(stock.title)
        .onAppear(perform: {
            stockArticleListVM.getStockArticlesByTitle(title: stock.title)
        })
    }
}

struct StockArticleListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "MSFT", title: "Microsoft", price: 250, quantity: 100)
        let stockVM = StockViewModel(stock: stock)
        
        StockArticleListScreen(stock: stockVM)
            .embedInNavigationView()
    }
}
