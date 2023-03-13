//
//  TrendingViewInteractor.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 26/01/23.
//

import Foundation

class TrendingInteractor {
    weak var presenter: TrendingInteractorOutputProtocol?
    var dataManager: TrendingDataManagerInputProtocol?
}

extension TrendingInteractor: TrendingInteractorInputProtocol {
    func fetchTrendingMedia(mediaType: MediaType, timeWindow: TimeWindowType, page: Int) {
        let trendingUrlString: String = Endpoint.trending(mediaType: mediaType,
                                                          timeWindow: timeWindow,
                                                          page: page).urlString
        dataManager?.requestTrendingMedia(trendingUrlString)
    }

    func fetchNextTrendingMedia(mediaType: MediaType, timeWindow: TimeWindowType, page: Int) {
        let nextMovieUrlString: String = Endpoint.nextTrendingMovie(mediaType: mediaType,
                                                                            timeWindow: timeWindow,
                                                                            page: page).urlString
        dataManager?.requestNextTrendingMedia(nextMovieUrlString)
    }

    func fetchSearchMovie(with keyword: String) {
        dataManager?.requestSearchMovie(Endpoint.searchMovie(byKeywork: keyword).urlString)
    }
}

extension TrendingInteractor: TrendingDataManagerOutputProtocol {
    func handleGetTrendingMedia(_ data: MovieResponse) {
        presenter?.onReceivedTrendingMedia(result: data)
    }

    func handleGetNextTrendingMedia(_ data: MovieResponse) {
        presenter?.onReceivedNextTrendingMedia(result: data)
    }

    func handleGetSearchMovie(_ data: MovieResponse) {
        presenter?.onReceivedSearchMovie(data: data)
    }

    func handleErrorService(_ error: Error) {
        presenter?.showViewError(error)
    }
}
