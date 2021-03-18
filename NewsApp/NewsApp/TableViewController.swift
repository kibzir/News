//
//  TableViewController.swift
//  NewsApp
//
//  Created by Владислав Козырь on 18.03.21.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    @IBAction func RefreshContr(_ sender: Any) {
    
        loadNews {
            DispatchQueue.main.async{
                self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            }
           
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async{
            self.tableView.reloadData()
            }
           
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count

      
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let article = articles[indexPath.row]
        var content = cell.defaultContentConfiguration()
      
        content.text = article.title
        content.textProperties.numberOfLines = 3
        cell.contentConfiguration = content
        
        /* if let url = URL(string: article.urlToImage){
             content.image = UIImage(data: try! Data(contentsOf: url))
             content.imageProperties.cornerRadius = tableView.rowHeight / 2
       
         } */
        
        
        
        
        
        
  
      /*  cell.textLabel?.text = article.title
        cell.textLabel?.numberOfLines = 3
        
        if let url = URL(string: article.urlToImage){
            cell.imageView?.image = UIImage(data: try! Data(contentsOf: url))
            cell.imageView?.layer.cornerRadius = tableView.rowHeight / 2
            cell.imageView?.clipsToBounds = true
        } else {
            
            cell.imageView?.image = UIImage(contentsOfFile: "noimage.png")
        }
        
      */
        
        
      /*  var content = cell.defaultContentConfiguration()
        content.text = article.title
        content.image = UIImage (named: )
        content.ImageProperties.cornerRadius = tableView.rowHeght / 2
       */
        
       // cell.imageView?.image = UIImage
        //cell.imageView?.layer.cornerRadius = tableView.rowHeght / 2
        //cell.imageView?.clipsToBounds = true
        
        /*
         if let url = URL(string: article.urlToImage){
             
             ImageView.image = UIImage(data: try! Data(contentsOf: url))
         }
         */

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "oneNews", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        (segue.destination as? ArticleViewController)?.article = articles[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        
 
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
