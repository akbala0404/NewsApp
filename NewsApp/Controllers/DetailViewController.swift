//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Акбала Тлеугалиева on 4/7/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var news = News()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = news.title
        posterImageView.sd_setImage(with: URL(string: news.urlToImage), completed: nil)
        publishedDateLabel.text = news.publishedAt
        authorLabel.text = news.author
        linkLabel.text = news.url
        descriptionLabel.text = news.description
        
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
