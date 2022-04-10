//
//  NewsTableViewController.swift
//  NewsApp
//
//  Created by Акбала Тлеугалиева on 4/7/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class NewsTableViewController: UITableViewController {
    var newsList = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchNews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func searchNews() {
            AF.request("https://newsapi.org/v2/everything?q=Apple&from=2022-04-09&sortBy=popularity&apiKey=2f082d67c7f746b89f4b0ac61940378e", method: .get, parameters: nil).responseJSON {
                response in
                if response.response?.statusCode == 200{
                    let json = JSON(response.value!)
                    if let array = json["articles"].array {
                        for item in array {
                            let news = News(json: item)
                            self.newsList.append(news)
                        }
                        
                    }
                    self.tableView.reloadData()

                }
            }
    }
    // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
              // #warning Incomplete implementation, return the number of sections
              return 1
          }

          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              // #warning Incomplete implementation, return the number of rows
              return newsList.count
          }

          
          override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
              cell.newsTitleLabel.text = newsList[indexPath.row].title
              cell.publishedDateLabel.text = newsList[indexPath.row].publishedAt
              cell.authorLabel.text = newsList[indexPath.row].author
              cell.posterImageView.sd_setImage(with: URL(string: newsList[indexPath.row].urlToImage), completed: nil)
              return cell
          }
          
          override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 170.0
          }
          override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              let viewcontroller = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
              navigationController?.show(viewcontroller, sender: self)
              viewcontroller.news = newsList[indexPath.row]


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
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              // Get the new view controller using segue.destination.
              // Pass the selected object to the new view controller.
          }
          */

      }

}
