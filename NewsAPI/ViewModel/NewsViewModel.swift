//
//  NewsViewModel.swift
//  NewsAPI
//
//  Created by Rizky Kamil Rabbani on 04/10/21.
//

import Foundation
import SwiftyJSON
import Combine

class NewsViewModel: ObservableObject{
  @Published var data = [News]()
  init(){
    
    let url =
    "https://newsapi.org/v2/top-headlines?country=id&apiKey=API KEY MASING MASING"
    
    let session = URLSession(configuration: .default)
    session.dataTask(with: URL(string: url)!)
    {(data, _, erorr) in
      //kalo error
      if erorr != nil{
        print ((erorr?.localizedDescription)!)
        return
      }
      //kalo ada data
      let json = try! JSON(data: data!)
      
      let items = json["articles"].array!
      
      for articles in items {
        let title = articles["title"].stringValue
        let description = articles["description"].stringValue
        let image = articles["urlToImage"].stringValue
        
        DispatchQueue.main.async {
          self.data.append(News(title: title, image: image, description: description))
        }
      }
    }.resume()
  }
}
