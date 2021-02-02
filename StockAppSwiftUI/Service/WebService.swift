//
//  WebService.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation

class WebService {
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
    guard let url = URL(string: "https://island-bramble.glitch.me/top-news")
    else {
    fatalError("Incorrect URL")
      }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    
    }
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
    //creates URL session
    guard let url = URL(string: "https://island-bramble.glitch.me/stocks")
    else {
    fatalError("Wrong URL")
    }
        //creates the data task
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data, error == nil
            else {
                completion(nil)
                return
            }
            //decodes the data
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
           
        }.resume()
    }
}
