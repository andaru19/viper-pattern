//
//  ArticleProtocols.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingArticle(category:String)
    func showDetilArticleController(navigationController:UINavigationController, detilArticleModel:ArticleModel)

}

protocol PresenterToViewProtocol: class{
    func showArticle(articleArray:Array<ArticleModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> ArticleViewController
    func pushToDetilArticleScreen(navigationConroller:UINavigationController, detilArticleModel:ArticleModel)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchArticle(category:String)
}

protocol InteractorToPresenterProtocol: class {
    func articleFetchedSuccess(articleModelArray:Array<ArticleModel>)
    func articleFetchFailed()
}
