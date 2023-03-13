//
//  UIViewController+Extension.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 01/02/23.
//

import UIKit

enum UIImageType {
    case systemName
    case named
}

extension UIViewController {
    func getUIImage(for name: String, type: UIImageType) -> UIImage {
        var uiImage: UIImage?
        switch type {
        case .systemName:
            uiImage = UIImage(systemName: name)
        case .named:
            uiImage = UIImage(named: name)
        }
        return uiImage ?? UIImage()
    }

    func addSearchBar() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = .mainPlaceholderSearchBar
        searchController.searchBar.searchTextField.backgroundColor = .lightGray
        navigationItem.searchController = searchController
        definesPresentationContext = true
        return searchController
    }
}
