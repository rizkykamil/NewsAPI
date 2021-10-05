//
//  ModelNews.swift
//  NewsAPI
//
//  Created by Rizky Kamil Rabbani on 04/10/21.
//

import Foundation

struct News : Identifiable{
  var id = UUID()
  var title : String
  var image : String
  var description: String
}
