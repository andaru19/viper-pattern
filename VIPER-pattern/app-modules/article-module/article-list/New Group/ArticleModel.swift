//
//  ArticleModel.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "title"
private let BRIEF = "author"
private let CONTENT = "content"
private let URL = "url"
private let FILESOURCE = "urlToImage"

class ArticleModel: Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var content:String?
    internal var filesource:String = "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn3.iconfinder.com%2Fdata%2Ficons%2Finficons%2F512%2Fstackoverflow.png&imgrefurl=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F273179%2Fstackoverflow_icon&tbnid=1MWiZKvy800vHM&vet=12ahUKEwiMtPPr_NL6AhURktgFHcj1CUcQMygcegUIARDvAQ..i&docid=3PC4DFHjf69LsM&w=512&h=512&q=stack%20overflow%20image%20png&ved=2ahUKEwiMtPPr_NL6AhURktgFHcj1CUcQMygcegUIARDvAQ"
    internal var url:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        filesource <- map[FILESOURCE]
        content <- map[CONTENT]
        url <- map[URL]
    }
}

