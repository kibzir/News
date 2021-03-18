//
//  Article.swift
//  NewsApp
//
//  Created by Владислав Козырь on 18.03.21.
//


import Foundation

struct Article{
    var author: String
    var title: String
    var url: String
    var description: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    init(dictionary: Dictionary<String, Any>){
        
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
    }
    
    
}
