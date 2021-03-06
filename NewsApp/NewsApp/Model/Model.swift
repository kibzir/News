//
//  Model.swift
//  NewsApp
//
//  Created by Владислав Козырь on 18.03.21.
//
//http://newsapi.org/v2/everything?q=tesla&from=2021-02-17&sortBy=publishedAt&apiKey=83d41dee0c914d45aebb67f286de6b0f


import Foundation

var articles: [Article] = []

var urlToData: URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/dataOfNews.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews(completionHandler: (()->Void)?){
    let url = URL(string: "http://newsapi.org/v2/everything?q=tesla&from=2021-02-17&sortBy=publishedAt&apiKey=83d41dee0c914d45aebb67f286de6b0f")
    let session = URLSession(configuration: .default)
    let downloadTsk = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
            print(urlToData) //test
            parseNews()
            print(articles.count) //test
            completionHandler?()
            
            
        }
    }
    downloadTsk.resume()
}



func parseNews() {

    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
      
        var returnArray: [Article] = []
       
        for dict in array {
            let NewArtical = Article(dictionary: dict)
            returnArray.append(NewArtical)
        }

        articles = returnArray
        
    }
   
}






/*
 import Foundation

 var articles: [Article] = []

 func loadNews() {
     let url = URL(string: "http://newsapi.org/v2/everything?q=tesla&from=2021-02-17&sortBy=publishedAt&apiKey=83d41dee0c914d45aebb67f286de6b0f")
     let session = URLSession(configuration: .default)
     let downloadTsk = session.downloadTask(with: url!) { (urlFile, responce, error) in
         if urlFile != nil {
             let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/dataOfNews.json"
             let urlPath = URL(fileURLWithPath: path)
             try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
             
             print(urlPath) //test
             parseNews()
             print(articles.count)
         }
     }
     downloadTsk.resume()
 }



 func parseNews() {
     let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/dataOfNews.json"
     let urlPath = URL(fileURLWithPath: path)
     
     let data = try? Data(contentsOf: urlPath)
     let rootDictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
     let array = rootDictionary!["articles"] as! [Dictionary<String, Any>]
     
     var returnArray: [Article] = []
     for dict in array {
         let newArticle = Article(dictionary: dict)
         returnArray.append(newArticle)
     }
          articles = returnArray
 }

 */
