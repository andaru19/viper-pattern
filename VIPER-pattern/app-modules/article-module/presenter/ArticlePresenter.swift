//
//  ArticlePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class ArticlePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingArticle() {
        interactor?.fetchArticle()
    }
    
    func showDetilArticleController(navigationController: UINavigationController, detilArticleModel:ArticleModel) {
        router?.pushToDetilArticleScreen(navigationConroller:navigationController, detilArticleModel:detilArticleModel)
    }

}

extension ArticlePresenter: InteractorToPresenterProtocol{
    
    func articleFetchedSuccess(articleModelArray: Array<ArticleModel>) {
        view?.showArticle(articleArray: articleModelArray)
    }
    
    func articleFetchFailed() {
        view?.showError()
    }
    
    
}
