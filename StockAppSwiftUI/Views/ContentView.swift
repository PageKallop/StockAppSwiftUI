//
//  ContentView.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    var body: some View {
        NavigationView{
            ZStack(alignment: .leading){
                Color.black
                Text("Feb 1st")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0,leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -340)
                SearchView(searchTerm: $searchTerm)
                    .offset(y: -290)
            }
                .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
