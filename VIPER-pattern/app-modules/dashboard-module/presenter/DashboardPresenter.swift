//
//  DashboardPresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 10/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class DashboardPresenter:ViewToPresenterDashboardProtocol {
    
    func showDashboardController(navigationController: UINavigationController, article: String) {
        router?.pushToArticleScreen(navigationConroller: navigationController, article: article)
    }
    
    func showListMovieController(navigationController: UINavigationController) {
        router?.pushToListMovieScreen(navigationConroller: navigationController)
    }
    
    
    
    
    var view: PresenterToViewDashboardProtocol?
    
    var interactor: PresenterToInteractorDashboardProtocol?
    
    var router: PresenterToRouterDashboardProtocol?
    
    func startFetchingDashboard() {
    }
    
    func showDetilDashboardController(navigationController: UINavigationController, article:String) {
        router?.pushToArticleScreen(navigationConroller: navigationController, article: article)
    }
    

}

extension DashboardPresenter: InteractorToPresenterDashboardProtocol{
    func dashboardFetchSuccess(dashboardList: Array<DetilArticleModel>) {
        
    }
    
    
    func dashboardFetchFailed() {
    }
    
    
}
