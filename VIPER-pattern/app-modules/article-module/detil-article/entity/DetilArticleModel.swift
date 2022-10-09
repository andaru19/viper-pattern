//
//  DetilArticleModel.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "author"
private let BRIEF = "title"
private let FILESOURCE = "description"
private let IMAGESOURCE = "urlToImage"

class DetilArticleModel: Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var filesource:String?
    internal var urlToImage:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        filesource <- map[FILESOURCE]
        urlToImage <- map[IMAGESOURCE]
    }
}
