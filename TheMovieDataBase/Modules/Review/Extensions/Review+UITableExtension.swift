//  Review+UITableExtension.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 24/02/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension ReviewView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return LocalizedConstants.commonHeightHeaderTable
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = getSectionHeaderForTableView(titleString: .reviewTitleTable,
                                                              width: Int(tableView.bounds.width))
        return headerView
    }
}

extension ReviewView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDataCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellReview.getIdentifier()) as? CellReview,
           let review = getReview(indexPath.row) {
            cell.backgroundColor = LocalizedConstants.commonPrimaryColor
            let review: ReviewType = ReviewType(title: "\(String.cellReviewWriteBy) \(review.author ?? "")",
                                                urlPhoto: review.authorDetails?.avatarPath ?? "",
                                                rate: Double(review.authorDetails?.rating ?? .zero),
                                                date: review.createdAt ?? "",
                                                content: review.content ?? "")
            cell.setData(with: review)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - CellReviewDelegate
extension ReviewView: CellReviewDelegate {
    func showMore() {
        reviewsTableView.reloadData()
    }
}
