//
//  AddStockView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import SwiftUI

struct AddStockScreen: View {
    
    @State private var symbol: String = ""
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var quantity: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        Form {
            
            TextField("Enter symbol", text: $symbol)
            TextField("Enter title", text: $title)
            TextField("Enter price", text: $price)
            TextField("Enter quantity", text: $quantity)
            
            HStack {
                Spacer()
                Button("Save") {
                
                    // save the stock
                    
                }
                Spacer()
            }
            
            
        }
        .navigationTitle("Add New Stock")
        .embedInNavigationView()
       
        
    }
}

struct AddStockScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddStockScreen()
    }
}
