//
//  ArticleRouter.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class ArticleRouter:PresenterToRouterProtocol{
    
    static func createModule() -> ArticleViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! ArticleViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ArticlePresenter()
        let interactor: PresenterToInteractorProtocol = ArticleInteractor()
        let router:PresenterToRouterProtocol = ArticleRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToDetilArticleScreen(navigationConroller navigationController:UINavigationController, detilArticleModel:ArticleModel) {
        
        let detilArticleModuel = DetilArticleRouter.createDetilArticleModule()
        detilArticleModuel.detilArticleModel = detilArticleModel
        navigationController.pushViewController(detilArticleModuel,animated: true)
        
    }
    
}
