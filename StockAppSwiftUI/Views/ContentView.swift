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
        UITableViewCell.appearance().backgroundConfiguration?.backgroundColor = UIColor.green

    }
    var body: some View {
        
        let filterStocks = self.stockListVM.searchTerm.isEmpty ?
            self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
      return  NavigationView{
            ZStack(alignment: .leading)
               {
                Color.black
                   Text("Feb 1st")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0,leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -340)
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -290)
                StockListView(stocks: filterStocks)
                    .offset(y: 250)

                
                NewsArticleView(newsArticles: self.stockListVM.news,
                onDragBegin: { value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 600)
                    }
                
                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
          
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
