//
//  NewsTableViewCell.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 23.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCellModel {
    
    let text: String?
    let imagesURL: [URL]?
    var images: [UIImage]? = []
    var isFavourite: Bool?
    
    
    init(text: String?, imagesURL: [URL]?, isFavourite: Bool = false) {
        self.text = text
        self.imagesURL = imagesURL
        self.isFavourite = isFavourite
    }
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var toFavouriteButton: UIButton!
    @IBOutlet weak var favouriteButtonView: UIView!
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var shortTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    var indexPath: IndexPath!
    var viewController: NewsViewFromCellInput!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
        self.backgroundColor = UIColor(hex: "f2f2f2")
        self.cellContentView.layer.cornerRadius = 7
        favouriteButtonView.layer.cornerRadius = 14
    }
    
    private func configureLabel() {
        shortTextLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
    }
    
    public func configure(with model: NewsTableViewCellModel) {
        
        shortTextLabel.text = editted(model.text ?? "Новость не загрузилась")
        guard let url = model.imagesURL?.first else { return }
        postImageView.sd_setImage(with: url, completed: .none)
        let newHeight = getNewHeight(from: postImageView.frame.size)
        let constraint = NSLayoutConstraint(item: postImageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: newHeight)
        postImageView.addConstraint(constraint)
        toFavouriteButton.titleLabel?.text = model.isFavourite! ? "ДОБАВЛЕНО" : "+ ИЗБРАННОЕ"
    }
    
    @IBAction func toFavouritesButtonPressed(_ sender: Any) {
        toFavouriteButton.titleLabel?.text = "ДОБАВЛЕНО"
        viewController.addToFavourites(at: indexPath)
    }
    
    
    private func getNewHeight(from size: CGSize) -> CGFloat {
        
        let imageViewWidth = postImageView.frame.width
        let ratio = imageViewWidth / size.width
        let newHeight = size.height * ratio
        return newHeight
    }
    
    private func editted(_ text: String) -> String {
        guard let index = text.range(of: "\n")?.lowerBound else { return text }
        return String(text.prefix(upTo: index))
        
    }
    
}
