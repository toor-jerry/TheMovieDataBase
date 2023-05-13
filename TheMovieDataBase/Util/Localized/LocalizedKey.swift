//
//  LocalizedKey.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 23/01/23.
//

import Foundation

extension String {
    // MARK: - Commons
    static let commonTitleShowAlertLoading = "Cargando.."
    static let commonMessageShowAlertLoading = "Por favor espere."

    // MARK: - ErrorPageView
    static let nameIcon404 = "notFound"
    static let errorPagePrincipalTitleLabel = " Ups!, ha ocurrido un error..."
    static let retryTitleButton = "Reintentar"

    // MARK: - Home
    static let homeTitle = "Inicio"
    static let homeNameIconTabBar = "house"
    static let homeTitleNowPlaying = "En cines:"
    static let homeTitlePopularMovies = "Populares:"
    static let homeTitleUpcoming = "Próximos estrenos:"
    static let homeTitleMoviesShow = "Películas visualizadas al momento:"

    // MARK: - Trending
    static let trendingTitle = "Búscar"
    static let trendingTitleUpdateTable = "Actualizando.."
    static let trendingTitleFilterTime = "Filtrar por:"
    static let trendingFilterByTimeTitles = ["📆Día", "🗓Semana"]
    static let trendingNameIconTabBar = "magnifyingglass"

    // MARK: - Review
    static let reviewTitleTable = "Reseñas"

    // MARK: - Main
    static let mainPlaceholderSearchBar = "Buscar.."

    // MARK: - CellReview
    static let cellReviewTitleShowMore = "Mostrar más"
    static let cellReviewTitleHide = "Ocultar"
    static let cellReviewWriteOn = "Escrito el"
    static let cellReviewWriteBy = "Escrito por:"

    // MARK: - InfiniteScrollActivityView
    static let infiniteScrollActivityViewTitleLoading = "Cargando más..."

    // MARK: - DetailView
    static let detailViewReviewTitle = "Reseñas:"
    static let detailShowAllTitle = "Mostrar todas"
    static let detailReviewsEmptyState = "No se cuenta con reseñas aún."
    static let detailTitleSimilarMovies = "Películas similares:"
    static let detailTitleMovieRecomendations = "Te podría gustar:"
}
