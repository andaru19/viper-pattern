//
//  WebViewArticleProtocols.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation

protocol ViewToPresenterWebViewArticleProtocol:class{
    
    var view: PresenterToViewWebViewArticleProtocol? {get set}
    var interactor: PresenterToInteractorWebViewArticleProtocol? {get set}
    var router: PresenterToRouterWebViewArticleProtocol? {get set}

}


protocol PresenterToViewWebViewArticleProtocol:class {
    
    func onWebViewArticleResponseSuccess(detilArticleModelArrayList:DetilArticleModel)
    func onWebViewArticleResponseFailed(error:String)
    
}

protocol PresenterToRouterWebViewArticleProtocol:class {
    
    static func createWebViewArticleModule()->WebViewArticleViewController

}

protocol PresenterToInteractorWebViewArticleProtocol:class {
    
    var presenter:InteractorToPresenterWebViewArticleProtocol? {get set}
    
}

protocol InteractorToPresenterWebViewArticleProtocol:class {
    
    func webViewArticleFetchSuccess(detilArticleList:DetilArticleModel)
    func webViewArticleFetchFailed()
    
}
