//  NowPlayingResult.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 01/03/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - NowPlayingResponse
struct NowPlayingResponse: Codable {
    var dates: Dates?
    var page: Int?
    var results: [NowPlayingResult]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    var maximum, minimum: String?
}

// MARK: - NowPlayingResult
struct NowPlayingResult: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
