//
//  StockListViewModel.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    //created a search property 
    var searchTerm: String = ""
    //created an array of a stock view list
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
     fetchStocks()
    }
    //calls data from webserver on main thread and maps it to stock view model
    private func fetchStocks() {
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
