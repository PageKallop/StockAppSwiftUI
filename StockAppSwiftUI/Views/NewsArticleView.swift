//
//  NewsArticleView.swift
//  StockAppSwiftUI
//
//  Created by Page Kallop on 2/2/21.
//

import SwiftUI

struct NewsArticleView: View {
   
    let newsArticles: [NewsArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        return VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Top News")
                    .foregroundColor(Color.gray)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                Text("From 🍏News")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding(2)
                ScrollView {
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News", imageURL: "https://media.wired.com/photos/5932a86652d99d6b984dfec4/191:100/w_1280,c_limit/peacock-eye-feathers-flickr-ozgurmulazimoglu.jpg", publication: "pub")
        
       return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
    }
}
