//
//  StockListView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import SwiftUI

struct StockListScreen: View {
    
    @ObservedObject var stockListVM = StockListViewModel()
    @State private var isPresented = false
    @State private var selectedStock: StockViewModel?
        
    var body: some View {
        
        VStack {
            
            Group {
                if stockListVM.hasBalance {
                    StockSummaryView(portfolioBalance: stockListVM.portfolioBalance)
                } else {
                    EmptyView()
                }
            }
            
            StockListView(stocks: stockListVM.stocks) { stock in
                selectedStock = stock
            }.listStyle(PlainListStyle())
            
            if let selectedStock = selectedStock {
                NavigationLink(
                    destination: StockArticleListScreen(stock: selectedStock),
                    isActive: .constant(true),
                    label: {
                        EmptyView()
                    })
            }
            
        }
        .onAppear(perform: {
            selectedStock = nil
        })
        .navigationTitle("Portfolio")
        .navigationBarItems(trailing: Button("Add Stock") {
            isPresented = true
        })
        .embedInNavigationView()
        
        .sheet(isPresented: $isPresented, onDismiss: {
            stockListVM.getAllStocks()
        }, content: {
            AddStockScreen()
        })
        .onAppear(perform: {
             stockListVM.getAllStocks()
        })
        
    }
}

struct StockListScreen_Previews: PreviewProvider {
    static var previews: some View {
        StockListScreen()
    }
}



struct StockSummaryView: View {
    
    let portfolioBalance: Double
    
    var body: some View {
        HStack {
            Spacer()
            Text("Total: \(portfolioBalance.formatAsCurrency())")
                .fontWeight(.bold)
            Spacer()
        }
    }
    
}
