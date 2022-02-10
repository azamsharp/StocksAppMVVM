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
        
        // display a list of articles based on the selected stock 
        List(1...20, id: \.self) { index in
            Text("Stock article \(index)")
        }.listStyle(PlainListStyle())
        
        
        .navigationTitle(stock.title)
        .onAppear(perform: {
            // get stock articles by title
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
