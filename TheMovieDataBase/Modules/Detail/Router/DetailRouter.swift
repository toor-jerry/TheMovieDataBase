//
//  DetailRouter.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 14/02/23.
//

import UIKit

final class DetailRouter: DetailRouterProtocol {
    weak var view: DetailViewProtocol?

    static func createModule(of idMovie: String) -> UIViewController {
        let view: DetailViewProtocol = DetailViewController(
            nibName: DetailViewController.identifier,
            bundle: nil)
        let service: NetworkingProviderProtocol = NetworkingProviderService(session: URLSession.shared)
        let dataManager: DetailDataManagerInputProtocol = DetailDataManager(providerNetworking: service)
        let interactor: DetailInteractorInputProtocol & DetailDataManagerOutputProtocol = DetailInteractor()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let router: DetailRouterProtocol = DetailRouter()

        router.view = view
        view.presenter = presenter
        view.idMovie = idMovie
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        dataManager.interactor = interactor
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        guard let view = view as? UIViewController else { return UIViewController() }
        return view
    }

    func showViewError(_ errorType: ErrorType) {
        guard let view = self.view as? UIViewController else { return }
        view.guaranteeMainThread {
            let errorPageVC: UIViewController = ErrorPageRouter.createModule(errorType: errorType)
            view.navigationController?.pushViewController(errorPageVC, animated: false)
        }
    }

    func showDetail(of idMovie: String) {
        guard let view = self.view as? UIViewController else { return }
        view.guaranteeMainThread {
            view.navigationController?.pushViewController(DetailRouter.createModule(of: idMovie),
                                                          animated: false)
        }
    }
}
