//
//  DetilArticleProtocols.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterDetilArticleProtocol:class{
    
    var view: PresenterToViewDetilArticleProtocol? {get set}
    var interactor: PresenterToInteractorDetilArticleProtocol? {get set}
    var router: PresenterToRouterDetilArticleProtocol? {get set}
    func showWebViewArticleController(navigationController:UINavigationController, detilArticleModel:ArticleModel)
}


protocol PresenterToViewDetilArticleProtocol:class {
    
    func onDetilArticleResponseSuccess(detilArticleModelArrayList:Array<DetilArticleModel>)
    func onDetilArticleResponseFailed(error:String)
    
}

protocol PresenterToRouterDetilArticleProtocol:class {
    
    static func createDetilArticleModule()->DetilArticleViewController
    func pushToWebViewArticleScreen(navigationConroller:UINavigationController, detilArticleModel:ArticleModel)
}

protocol PresenterToInteractorDetilArticleProtocol:class {
    
    var presenter:InteractorToPresenterDetilArticleProtocol? {get set}
    
}

protocol InteractorToPresenterDetilArticleProtocol:class {
    
    func detilArticleFetchSuccess(detilArticleList:Array<DetilArticleModel>)
    func detilArticleFetchFailed()
    
}
