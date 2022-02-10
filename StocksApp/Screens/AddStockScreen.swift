//
//  AddStockView.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import SwiftUI

struct AddStockScreen: View {
    
    @State private var addStockVS = AddStockViewState()
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addStockVM: AddStockViewModel = AddStockViewModel()
    
    var body: some View {
        
        Form {
            
            TextField("Enter symbol", text: $addStockVS.symbol)
            TextField("Enter title", text: $addStockVS.title)
            TextField("Enter price", text: $addStockVS.price)
            TextField("Enter quantity", text: $addStockVS.quantity)
            
            HStack {
                Spacer()
                Button("Save") {
                
                    addStockVM.addStock(addStockVS) {
                        presentationMode.wrappedValue.dismiss()
                    }
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
