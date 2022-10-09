//
//  DashboardProtocols.swift
//  VIPER-pattern
//
//  Created by Andaru on 10/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterDashboardProtocol:class{
    
    var view: PresenterToViewDashboardProtocol? {get set}
    var interactor: PresenterToInteractorDashboardProtocol? {get set}
    var router: PresenterToRouterDashboardProtocol? {get set}
    func showDashboardController(navigationController:UINavigationController, article:String)
    func showListMovieController(navigationController:UINavigationController)
}


protocol PresenterToViewDashboardProtocol:class {
    
    func onDashboardResponseSuccess(detilArticleModelArrayList:Array<DetilArticleModel>)
    func onDashboardResponseFailed(error:String)
    
}

protocol PresenterToRouterDashboardProtocol:class {
    
    static func createDashboardModule()->DashboardViewController
    func pushToArticleScreen(navigationConroller:UINavigationController, article:String)
    func pushToListMovieScreen(navigationConroller:UINavigationController)
    
}

protocol PresenterToInteractorDashboardProtocol:class {
    
    var presenter:InteractorToPresenterDashboardProtocol? {get set}
    
}

protocol InteractorToPresenterDashboardProtocol:class {
    
    func dashboardFetchSuccess(dashboardList:Array<DetilArticleModel>)
    func dashboardFetchFailed()
    
}
