//
//  WebViewArticleRouter.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class WebViewArticleRouter:PresenterToRouterWebViewArticleProtocol{
    
    
    static func createWebViewArticleModule() -> WebViewArticleViewController {
        
        let view = WebViewArticleRouter.mainstoryboard.instantiateViewController(withIdentifier: "WebViewArticleViewController") as! WebViewArticleViewController
        
        let presenter: ViewToPresenterWebViewArticleProtocol & InteractorToPresenterWebViewArticleProtocol = WebViewArticlePresenter()
        let interactor: PresenterToInteractorWebViewArticleProtocol = WebViewArticleInteractor()
        let router:PresenterToRouterWebViewArticleProtocol = WebViewArticleRouter()
        
        view.webViewArticlePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
