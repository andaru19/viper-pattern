//
//  ArticleInteractor.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ArticleInteractor: PresenterToInteractorProtocol{
    
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchArticle(category:String) {
        Alamofire.request(API_BASE_ARTICLE_LIST + category + API_ARTICLE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["articles"] as! NSArray
                    let arrayObject = Mapper<ArticleModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.articleFetchedSuccess(articleModelArray: arrayObject)
                }
            }else {
                self.presenter?.articleFetchFailed()
            }
        }
    }
    
    
    
    
}
