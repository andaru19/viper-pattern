//
//  WebViewArticlePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation

class WebViewArticlePresenter:ViewToPresenterWebViewArticleProtocol{
    
    var view: PresenterToViewWebViewArticleProtocol?
    
    var interactor: PresenterToInteractorWebViewArticleProtocol?
    
    var router: PresenterToRouterWebViewArticleProtocol?
    
}

extension WebViewArticlePresenter:InteractorToPresenterWebViewArticleProtocol{
    
    
    func webViewArticleFetchSuccess(detilArticleList: DetilArticleModel) {
        view?.onWebViewArticleResponseSuccess(detilArticleModelArrayList: detilArticleList)
    }
    
    func webViewArticleFetchFailed() {
        view?.onWebViewArticleResponseFailed(error: "Some Error message from api response")
    }
    
    
}
