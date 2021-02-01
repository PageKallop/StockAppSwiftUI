//
//  StockViewModel.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation

struct StockViewModel{
    
    let stock : Stock
    //creates and formats a stock view list
    var symbol: String{
        return self.stock.symbol.uppercased()
    }
    var description: String {
        return self.stock.description
    }
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
}
