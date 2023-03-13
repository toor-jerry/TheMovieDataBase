//
//  ErrorPagePresenter.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 31/01/23.
//

import Foundation

class ErrorPagePresenter {
    // MARK: - Protocol properties
    var router: ErrorPageRouterProtocol?
    weak var view: ErrorPageViewProtocol?
    var interactor: ErrorPageInteractorInputProtocol?

    func closeThisInstance() {
        router?.closeThisInstance()
    }
}

extension ErrorPagePresenter: ErrorPagePresenterProtocol { }

extension ErrorPagePresenter: ErrorPageInteractorOutputProtocol { }
