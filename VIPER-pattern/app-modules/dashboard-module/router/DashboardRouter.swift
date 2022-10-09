//
//  DashboardRouter.swift
//  VIPER-pattern
//
//  Created by Andaru on 10/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter:PresenterToRouterDashboardProtocol{
   
    static func createDashboardModule() -> DashboardViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let presenter: ViewToPresenterDashboardProtocol & InteractorToPresenterDashboardProtocol = DashboardPresenter()
        let interactor: PresenterToInteractorDashboardProtocol = DashboardInteractor()
        let router:PresenterToRouterDashboardProtocol = DashboardRouter()
        
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
    
    func pushToArticleScreen(navigationConroller: UINavigationController, article: String) {
    
        let articleViewArticleModuel = ArticleRouter.createModule()
        articleViewArticleModuel.article = article
        navigationConroller.pushViewController(articleViewArticleModuel,animated: true)
        
    }
    
    func pushToListMovieScreen(navigationConroller: UINavigationController) {
    
        let movieViewModuel = MovieRouter.createMovieModule()
        navigationConroller.pushViewController(movieViewModuel,animated: true)
        
    }
    
    
    
}
