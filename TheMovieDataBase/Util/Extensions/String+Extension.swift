//
//  String+Extension.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 23/01/23.
//

import UIKit

extension String {
    func getColoredString(color: UIColor) -> NSMutableAttributedString {
        let range = NSString(string: self).range(of: self)
        let mutableAttributedString = NSMutableAttributedString.init(string: self)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        mutableAttributedString.addAttribute(.font, value: LocalizedConstants.commonTitleFont, range: range)
        return mutableAttributedString
    }

    func getDateFormatted() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let dateFormatted = dateFormatterGet.date(from: self) {
                dateFormatterGet.dateFormat = "dd/MM/yyyy"
                return dateFormatterGet.string(from: dateFormatted)
        }
        return ""
    }
}
