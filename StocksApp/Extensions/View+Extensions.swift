//
//  View+Extensions.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
