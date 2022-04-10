//
//  News.swift
//  NewsApp
//
//  Created by Акбала Тлеугалиева on 4/7/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import Foundation
import SwiftyJSON

class News {
    var title = ""
    var publishedAt = ""
    var urlToImage = ""
    var author = ""
    var url = ""
    var description = ""
    init (){

    }
    init (json: JSON){
       if let temp = json["title"].string{
            title = temp
        }
        if let temp = json["publishedAt"].string{
                 publishedAt = temp
             }
        if let temp = json["urlToImage"].string{
                 urlToImage = temp
             }
        if let temp = json["author"].string{
                 author  = temp
             }
        if let temp = json["url"].string{
                        url  = temp
                    }
        if let temp = json["description"].string{
                        description  = temp
                    }
    }

}

