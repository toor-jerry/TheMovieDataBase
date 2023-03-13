//
//  InfiniteScrollActivityView.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 13/02/23.
//

import UIKit

final class InfiniteScrollActivityView: UIView {
    let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    static let defaultHeight: CGFloat = LocalizedConstants.infiniteScrollActivityViewDefaultHeight

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupActivityIndicator()
    }

    override init(frame aRect: CGRect) {
        super.init(frame: aRect)
        setupActivityIndicator()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let numberDivisor: CGFloat = LocalizedConstants.infiniteScrollActivityViewDivisorNumber
        let boundsSize: CGSize = bounds.size
        activityIndicatorView.center = CGPoint(x: boundsSize.width / numberDivisor,
                                               y: boundsSize.height / numberDivisor)
    }

    func setupActivityIndicator() {
        activityIndicatorView.style = .large
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .white

        activityIndicatorView.addSubview(getLoadingTextLabel())
        addSubview(activityIndicatorView)
    }

    func getLoadingTextLabel() -> UILabel {
        let loadingTextLabel: UILabel = UILabel()
        loadingTextLabel.textColor = UIColor.white
        loadingTextLabel.text = .infiniteScrollActivityViewTitleLoading
        loadingTextLabel.font = LocalizedConstants.commonTitleFont
        loadingTextLabel.sizeToFit()
        let valueY: CGFloat = activityIndicatorView.center.y + LocalizedConstants.infiniteScrollActivityViewSpaceTop
        loadingTextLabel.center = CGPoint(x: activityIndicatorView.center.x,
                                          y: valueY)
        return loadingTextLabel
    }

    func stopAnimating() {
        activityIndicatorView.stopAnimating()
        isHidden = true
    }

    func startAnimating() {
        isHidden = false
        activityIndicatorView.startAnimating()
    }
}
