//
//  NewsArticleViewModel.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/2/21.
//

import Foundation
import URLImage

struct NewsArticleViewModel {
    let article : Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }

}
