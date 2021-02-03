//
//  StockListViewModel.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
   
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 600)
    //created a search property 
    @Published var searchTerm: String = ""
    //created an array of a stock view list
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    func load() {
     fetchStocks()
        fetchNews()
    }
    
    private func fetchNews() {
        WebService().getTopNews { new in
            if let news = new {
                self.news = news.map(NewsArticleViewModel.init)
            }
        }
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
