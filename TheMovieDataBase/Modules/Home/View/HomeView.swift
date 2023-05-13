//  HomeView.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 19/02/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HomeView: UIViewController {

    // MARK: - Declaration IBOutlets
    @IBOutlet weak private var movieTopSlider: ImageSlider!
    @IBOutlet weak private var nowPlayingSlider: ImageSlider!
    @IBOutlet weak var popularImageSlider: ImageSlider!
    @IBOutlet weak var upcomingMoviesSlider: ImageSlider!
    @IBOutlet weak private var titleNowPlayingLabel: UILabel! {
        didSet {
            titleNowPlayingLabel.text = .homeTitleNowPlaying
        }
    }
    @IBOutlet weak var titlePopularMoviesLabel: UILabel! {
        didSet {
            titlePopularMoviesLabel.text = .homeTitlePopularMovies
        }
    }
    @IBOutlet weak var upcomingMoviesTitleLabel: UILabel! {
        didSet {
            upcomingMoviesTitleLabel.text = .homeTitleUpcoming
        }
    }
    @IBOutlet weak private var moviesShowLabel: UILabel! {
        didSet {
            moviesShowLabel.text = "\(String.homeTitleMoviesShow) \(totalMoviesShow)"
        }
    }

    // MARK: - Protocol properties
    var presenter: HomePresenterProtocol?
    var movieTopRated: [MovieTopRatedResult]?
    var nowPlaying: [NowPlayingResult]?
    var popularMovies: [PopularMoviesModelResult]?
    var upcomingMovies: [UpcomingModelResult]?

    // MARK: - Private properties
    private var errorGetData: Bool = false
    private var isLoading: Bool = true
    private var totalMoviesShow: Int = .zero {
        didSet {
            moviesShowLabel.text = "\(String.homeTitleMoviesShow) \(totalMoviesShow)"
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        hideSearchBar()
        addObservers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isLoading || errorGetData {
            showLoader()
        }

        if errorGetData {
            callService()
        }

        movieTopSlider.initTimer()
        nowPlayingSlider.initTimer()
        popularImageSlider.initTimer()
        upcomingMoviesSlider.initTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        movieTopSlider.stopTimmer()
        nowPlayingSlider.stopTimmer()
        popularImageSlider.stopTimmer()
        upcomingMoviesSlider.stopTimmer()
        stopLoading()
    }

    // MARK: - Private methods
    private func hideSearchBar() {
        navigationItem.searchController = .none
    }

    private func showLoader() {
        guaranteeMainThread {
            self.view.showLoader()
        }
    }

    private func callService() {
        isLoading = true
        getData()
    }

    private func getData() {
        presenter?.willFetchData()
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(aumentMovieShow),
                                               name: .notificacionCenterNameShowDetail,
                                               object: nil)
    }

    @objc private func aumentMovieShow(_ notification: Notification) {
        totalMoviesShow += LocalizedConstants.commonIncrementNumber
    }
}

extension HomeView: HomeViewProtocol {
    func updateView(data: [UpcomingModelResult]) {
        upcomingMovies = data
        var posterUrlString: [String] = []
        data.forEach { movie in
            if let poster = movie.posterPath {
                posterUrlString.append(poster)
            }
        }

        upcomingMoviesSlider.setUp(imageUrlArray: posterUrlString, imageContentMode: .scaleAspectFit)
        upcomingMoviesSlider.delegate = self
    }

    func updateView(data: [PopularMoviesModelResult]) {
        popularMovies = data
        var posterUrlString: [String] = []
        data.forEach { movie in
            if let poster = movie.posterPath {
                posterUrlString.append(poster)
            }
        }

        popularImageSlider.setUp(imageUrlArray: posterUrlString, imageContentMode: .scaleAspectFit)
        popularImageSlider.delegate = self
    }

    func updateView(data: [NowPlayingResult]) {
        nowPlaying = data
        var posterUrlString: [String] = []
        data.forEach { movie in
            if let poster = movie.posterPath {
                posterUrlString.append(poster)
            }
        }

        nowPlayingSlider.setUp(imageUrlArray: posterUrlString, imageContentMode: .scaleAspectFit)
        nowPlayingSlider.delegate = self
    }

    func updateView(data: [MovieTopRatedResult]) {
        movieTopRated = data
        var cellMovieType = [CellMovieType]()
        data.forEach { movie in
            if let bac = movie.backdropPath {
                let imageUrlString: String = Endpoint.img(idImage: bac, sizeImage: .w500).urlString
                cellMovieType.append(CellMovieType(imageUrlString: imageUrlString, title: movie.title ?? ""))
            }
        }

        movieTopSlider.setUp(cellMovieType)
        movieTopSlider.delegate = self
    }

    func stopLoading() {
        guaranteeMainThread {
            self.isLoading = false
            self.view.removeLoader()
        }
    }

    func setErrorGettingData(_ status: Bool) {
        errorGetData = status
    }
}

extension HomeView: ImageSliderDelegate {
    func indexDidSelect(_ index: Int, object: ImageSlider) {
        var idMovie: Int = .zero
        if object.isEqual(movieTopSlider),
           let id = movieTopRated?[index].id as? Int {
            idMovie = id
        } else if object.isEqual(nowPlayingSlider),
                  let id = nowPlaying?[index].id as? Int {
            idMovie = id
        } else if object.isEqual(popularImageSlider),
                  let id = popularMovies?[index].id as? Int {
            idMovie = id
        } else if object.isEqual(upcomingMoviesSlider),
                  let id = upcomingMovies?[index].id as? Int {
            idMovie = id
        }
        presenter?.willShowDetail(of: idMovie.description)
    }
}
