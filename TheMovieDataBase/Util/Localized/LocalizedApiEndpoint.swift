//  LocalizedApiEndpoint.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 19/05/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum LocalizedApiEndpoint {
    static let apiKeyTheMovieDb: String = "11cb2f010156ee8a3d0fb93624ceacea"
    static let theMovieDbBasePath: String = "https://api.themoviedb.org/3"
    static let theMovieDBBasePathImages: String = "https://image.tmdb.org/t/p"
    static let apiLang: String = "es"
    static let apiRegion = "MX"
    static let apiKeyEndPointTrending = "/trending"
    static let apiKeyEndPointMovieTopRated = "/movie/top_rated"
    static let apiKeyEndPointMovie = "/movie"
    static let apiKeyEndPointMovieSearch = "/search/movie"
    static let apiKeyEndPointNowPlaying = "/movie/now_playing"
    static let apiKeyEndPointPopularMovies = "/movie/popular"
    static let apiKeyEndPointUpcomingMovies = "/movie/popular"
    static let apiKeyEndPointRecomendations = "/recommendations"
    static let theMovieDbEndBaseUrl = "?api_key=\(apiKeyTheMovieDb)&language=\(apiLang)&region=\(apiRegion)"
    static let theMovieDbAppendImages = "&append_to_response=images&include_image_language=\(apiLang),null"
}
