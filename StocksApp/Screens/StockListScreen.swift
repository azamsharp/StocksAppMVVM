//
//  StockListView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import SwiftUI

struct StockListScreen: View {
    
    @State private var isPresented = false
    @State private var selectedStock: StockViewModel?
    
    let stocks = ["SEARS", "GMSP", "APLE", "BLBUS", "ENRON"]
    
    var body: some View {
        
        VStack {
            
            List(stocks, id: \.self) { stock in
                
                NavigationLink(
                    destination: Text("Show stock news"),
                    label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(stock)
                                    .fontWeight(.bold)
                                Text("stock name")
                            }
                            
                            Spacer()
                            Text("$\(Double.random(in: 20...200))")
                        }
                    })
                
                
                
            }.listStyle(PlainListStyle())
            
            /* COVERED LATER IN THE SESSION 
            if let selectedStock = selectedStock {
                NavigationLink(
                    destination: StockArticleListScreen(stock: selectedStock),
                    isActive: .constant(true),
                    label: {
                        EmptyView()
                    })
            } */
            
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
            // get all stocks
            
        }, content: {
            AddStockScreen()
        })
        .onAppear(perform: {
            // get all stocks
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
