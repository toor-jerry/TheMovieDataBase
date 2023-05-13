//
//  CellMovie.swift
//  TheMovieDataBase
//
//  Created by Gerardo Bautista Castañeda on 24/01/23.
//

import UIKit

enum AccesoryType {
    case eye, eyeFill
}

final class CellMovie: UITableViewCell {

    @IBOutlet weak private var photoImageView: UIImageView! {
        didSet {
            photoImageView.addRounding()
        }
    }

    @IBOutlet weak private var lblTitle: UILabel! {
        didSet {
            lblTitle.textColor = LocalizedConstants.commonSecondaryColor
            lblTitle.addShadow(.white)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(title: String, imageUrl: String?) {
        lblTitle.text = title
        if let imageUrl = imageUrl {
            photoImageView.loadImage(id: imageUrl)
        } else {
            photoImageView.image = LocalizedConstants.commonImageDefault
        }
    }

    func addAccessoryView(accesory: AccesoryType) {
        var checkImage: UIImage
        var color: UIColor
        switch accesory {
        case .eye:
            checkImage = UIImage(systemName: "eye") ?? UIImage()
            color = .white
        case .eyeFill:
            checkImage = UIImage(systemName: "eye.fill") ?? UIImage()
            color = LocalizedConstants.commonSecondaryColor
        }
        let checkmark: UIImageView = UIImageView(image: checkImage)
        checkmark.tintColor = color
        self.accessoryView = checkmark
    }
}
