//
//  WebService.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/1/21.
//

import Foundation

class WebService {
    
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
            stocks == nil ? completion(nil) : completion(stocks)
        }.resume()
    }
}
