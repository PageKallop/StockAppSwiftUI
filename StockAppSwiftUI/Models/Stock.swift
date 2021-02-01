//
//  Stock.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation
//structure to decode 
struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String 
}
