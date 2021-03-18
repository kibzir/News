//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by Владислав Козырь on 18.03.21.
//

import UIKit
import SafariServices
class ArticleViewController: UIViewController {

    var article: Article!

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var Titl: UILabel!
    
    @IBOutlet weak var Descript: UILabel!
     
    @IBAction func GoToSafari(_ sender: Any) {
        
        if let url = URL(string: article.url){         //открываею в браузере 
        let SafariVC = SFSafariViewController(url: url)
        present(SafariVC, animated: true, completion: nil)
        }
    }
    
    
    
    @IBOutlet weak var AuthorOfArticle: UILabel!
    
    @IBOutlet weak var Published: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Titl.text = article.title
        Descript.text = article.description
        AuthorOfArticle.text = article.author
        Published.text = article.publishedAt
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage){
                
                self.ImageView.image = UIImage(data: try! Data(contentsOf: url))
            } else {
                
                self.ImageView.image = UIImage(contentsOfFile: "noimage.png")
            }
            
        }
        
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
