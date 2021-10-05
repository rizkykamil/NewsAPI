//
//  NewsDetail.swift
//  NewsAPI
//
//  Created by Rizky Kamil Rabbani on 04/10/21.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NewsDetail: View {
  let news: News
    var body: some View {
      ScrollView{
        VStack(alignment: .leading){
          if news.image != ""{
            WebImage(url: URL(string: news.image)!)
              .resizable()
              .scaledToFit()
              .clipped()
          }else{
            Image("loader")
              .resizable()
              .scaledToFit()
              .clipped()
          }
          VStack(alignment: .leading, spacing: 20){
            Text(news.title)
              .font(.title)
              .bold()
            Text(news.description)
              .font(.body)
          }
          .padding()
        }
        .padding()
      }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
      NewsDetail(news: News(title: "", image: "", description: ""))
    }
}
