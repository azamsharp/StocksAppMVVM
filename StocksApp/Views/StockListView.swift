//
//  StockListView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/27/21.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    let onSelected: ((StockViewModel) -> Void)?
    
    
    init(stocks: [StockViewModel], onSelected: ((StockViewModel) -> Void)? = nil) {
        self.stocks = stocks
        self.onSelected = onSelected
    }
    
    var body: some View {
        
        List(stocks, id: \.id) { stock in
           
            StockCellView(stock: stock, showChevron: onSelected != nil ? true : false)
                .onTapGesture {
                    if let onSelected = onSelected {
                        onSelected(stock)
                    }
                }
        }
        
    }
}

struct StockCellView: View {
    
    let stock: StockViewModel
    var showChevron: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol.uppercased())
                    .fontWeight(.bold)
                Text(stock.title)
                    .font(.caption)
                
            }
            Spacer()
            Text(stock.marketValue.formatAsCurrency())
            if showChevron {
                Image(systemName: "chevron.right")
            }
           
        }.contentShape(Rectangle())
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "APLE", title: "Apple", price: 142, quantity: 100)
        let stockVM = StockViewModel(stock: stock)
        
        return StockListView(stocks: [stockVM])
    }
}
