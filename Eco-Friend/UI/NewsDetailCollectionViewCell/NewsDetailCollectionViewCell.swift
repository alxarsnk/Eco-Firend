//
//  NewsDetailCollectionViewCell.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 18.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import SDWebImage

enum  BaseViewControllerType {
    case detail
    case popup
}

class NewsDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.contentMode = .scaleAspectFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }

    public func configureCell(withURL url: URL, and vcType: BaseViewControllerType) {
        switch vcType {
        case .popup:
             postImageView.contentMode = .scaleAspectFit
        default:
             postImageView.contentMode = .scaleAspectFill
        }
        postImageView.sd_setImage(with: url, completed: nil)
    }
    
}
