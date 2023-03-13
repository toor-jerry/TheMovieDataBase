//  HomePresenter.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 19/02/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class HomePresenter {
    // MARK: - Protocol properties
    var router: HomeRouterProtocol?
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func willFetchMovieTopRated() {
        interactor?.fetchMovieTopRated()
    }

    func willFetchNowPlaying() {
        interactor?.fetchNowPlaying()
    }

    func willShowDetail(of idMovie: String) {
        router?.showDetail(of: idMovie)
    }

    func willFetchPopularMovies() {
        interactor?.fetchPopularMovies()
    }

    func willFetchUpcomingMovies() {
        interactor?.fetchUpcomingMovies()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func onReceivedMovieTopRated(_ result: [MovieTopRatedResult]) {
        view?.setErrorGettingData(false)
        view?.updateView(data: result)
        view?.stopLoading()
    }

    func onReceivedNowPlaying(_ result: [NowPlayingResult]) {
        view?.setErrorGettingData(false)
        view?.updateView(data: result)
        view?.stopLoading()
    }

    func onReceivedPopularMovies(_ result: [PopularMoviesModelResult]) {
        view?.setErrorGettingData(false)
        view?.updateView(data: result)
        view?.stopLoading()
    }

    func onReceivedUpcomingMovies(_ result: [UpcomingModelResult]) {
        view?.setErrorGettingData(false)
        view?.updateView(data: result)
        view?.stopLoading()
    }

    func showViewError(_ error: Error) {
        var errorModel: ErrorType
        if let fetchedError: ServiceError = error as? ServiceError {
             errorModel = ErrorType(serviceError: fetchedError)
        } else {
            errorModel = ErrorType(title: error.localizedDescription,
                                   message: "Error code: \(error._code) - \(error._domain)")
        }
        view?.setErrorGettingData(true)
        router?.showViewError(errorModel)
    }
}
