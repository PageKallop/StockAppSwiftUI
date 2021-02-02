//
//  ContentView.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
  
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        stockListVM.load()
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.green

    }
    var body: some View {
        
        let filterStocks = self.stockListVM.searchTerm.isEmpty ?
            self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        NavigationView{
            ZStack(alignment: .leading)
               {
                Color.black
                Text("Feb 1st")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0,leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -340)
                StockListView(stocks: filterStocks)
                    .offset(y: 250)
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -290)
                NewsArticleView(newsArticles: self.stockListVM.news)
                    .offset(y: 500)
          
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set([.bottom]))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
