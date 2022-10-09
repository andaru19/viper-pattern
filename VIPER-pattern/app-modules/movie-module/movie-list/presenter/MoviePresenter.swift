//
//  MoviePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation

class MoviePresenter:ViewToPresenterMovieProtocol{
    
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie()
    }
    
}

extension MoviePresenter:InteractorToPresenterMovieProtocol{
    
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
