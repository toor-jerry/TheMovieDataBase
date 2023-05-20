//
//  Endpoint.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 14/02/23.
//

import Foundation

enum BaseUrl {
    case images(sizeImage: SizeImageType)
    case api
    case apiWithEndPoint(endPoint: String)

    var url: String {
        switch self {
        case .images(sizeImage: let size):
            return "\(LocalizedApiEndpoint.theMovieDBBasePathImages)/\(size.rawValue)"
        case .api:
            return LocalizedApiEndpoint.theMovieDbBasePath
        case .apiWithEndPoint(endPoint: let url):
            return "\(LocalizedApiEndpoint.theMovieDbBasePath)\(url)\(LocalizedApiEndpoint.theMovieDbEndBaseUrl)"
        }
    }
}

enum Endpoint {

    case img(idImage: String, sizeImage: SizeImageType)
    case trending(mediaType: MediaType, timeWindow: TimeWindowType, page: Int)
    case detail(idMovie: String)
    case topRated
    case reviews(idMovie: String)
    case searchMovie(byKeywork: String)
    case nowPlaying
    case similarMovie(idMovie: String)
    case poularMovies
    case upcoming
    case recomendations(idMovie: String)
    case nextTrendingMovie(mediaType: MediaType, timeWindow: TimeWindowType, page: Int)
}

extension Endpoint {
    var urlString: String {
        switch self {
        case .img(idImage: let id, sizeImage: let size):
            return "\(BaseUrl.images(sizeImage: size).url)/\(id)"
        case .trending(mediaType: let media, timeWindow: let time, page: let page):
            let url: String = "\(LocalizedApiEndpoint.apiKeyEndPointTrending)/\(media.rawValue)/\(time.rawValue)"
            return "\(BaseUrl.apiWithEndPoint(endPoint: url).url)&page=\(page)"
        case .detail(idMovie: let movie):
            return "\(BaseUrl.api.url)/movie/\(movie)\(LocalizedApiEndpoint.theMovieDbEndBaseUrl)\(LocalizedApiEndpoint.theMovieDbAppendImages)"
        case .topRated:
            return BaseUrl.apiWithEndPoint(endPoint: LocalizedApiEndpoint.apiKeyEndPointMovieTopRated).url
        case .reviews(idMovie: let movie):
            let reviewsUrlString: String = "\(LocalizedApiEndpoint.apiKeyEndPointMovie)/\(movie)/reviews"
            return BaseUrl.apiWithEndPoint(endPoint: reviewsUrlString).url
        case .searchMovie(byKeywork: let keyWord):
            let searchMovieUrlString: String = LocalizedApiEndpoint.apiKeyEndPointMovieSearch
            return "\(BaseUrl.apiWithEndPoint(endPoint: searchMovieUrlString).url)&query=\(keyWord)"
        case .nowPlaying:
            return BaseUrl.apiWithEndPoint(endPoint: LocalizedApiEndpoint.apiKeyEndPointNowPlaying).url
        case .similarMovie(idMovie: let movie):
            let similarUrlString: String = "\(LocalizedApiEndpoint.apiKeyEndPointMovie)/\(movie)/similar"
            return "\(BaseUrl.apiWithEndPoint(endPoint: similarUrlString).url)"
        case .poularMovies:
            return BaseUrl.apiWithEndPoint(endPoint: LocalizedApiEndpoint.apiKeyEndPointPopularMovies).url
        case .upcoming:
            return BaseUrl.apiWithEndPoint(endPoint: LocalizedApiEndpoint.apiKeyEndPointUpcomingMovies).url
        case .recomendations(idMovie: let idMovie):
            let endPointMovie: String = LocalizedApiEndpoint.apiKeyEndPointMovie
            let recomendationsUrlString: String = "\(endPointMovie)/\(idMovie)/\(LocalizedApiEndpoint.apiKeyEndPointRecomendations)"
            return "\(BaseUrl.apiWithEndPoint(endPoint: recomendationsUrlString).url)"
        case .nextTrendingMovie(mediaType: let mediaType, timeWindow: let timeWindow, page: let page):
            let url: String = "\(LocalizedApiEndpoint.apiKeyEndPointTrending)/\(mediaType.rawValue)/\(timeWindow.rawValue)"
            return "\(BaseUrl.apiWithEndPoint(endPoint: url).url)&page=\(page)"
        }
    }
}
