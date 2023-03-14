//
//  ErrorPagePresenter.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 31/01/23.
//

import Foundation

final class ErrorPagePresenter: ErrorPagePresenterProtocol, ErrorPageInteractorOutputProtocol {
    // MARK: - Protocol properties
    var router: ErrorPageRouterProtocol?
    weak var view: ErrorPageViewProtocol?
    var interactor: ErrorPageInteractorInputProtocol?

    func closeThisInstance() {
        router?.closeThisInstance()
    }
}
