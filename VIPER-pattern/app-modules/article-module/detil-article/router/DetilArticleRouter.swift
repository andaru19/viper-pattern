//
//  DetilArticleRouter.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class DetilArticleRouter:PresenterToRouterDetilArticleProtocol{
    
    static func createDetilArticleModule() -> DetilArticleViewController {
        
        let view = DetilArticleRouter.mainstoryboard.instantiateViewController(withIdentifier: "DetilArticleViewController") as! DetilArticleViewController
        
        let presenter: ViewToPresenterDetilArticleProtocol & InteractorToPresenterDetilArticleProtocol = DetilArticlePresenter()
        let interactor: PresenterToInteractorDetilArticleProtocol = DetilArticleInteractor()
        let router:PresenterToRouterDetilArticleProtocol = DetilArticleRouter()
        
        view.detilArticlePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
   
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToWebViewArticleScreen(navigationConroller navigationController:UINavigationController, detilArticleModel:ArticleModel) {
    
        let webViewArticleModuel = WebViewArticleRouter.createWebViewArticleModule()
        webViewArticleModuel.detilArticleModel = detilArticleModel
        navigationController.pushViewController(webViewArticleModuel,animated: true)
        
    }
    
}
