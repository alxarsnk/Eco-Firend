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
    var isFavourite: Bool!
    var constraint: NSLayoutConstraint!
    let transformer = SDImageResizingTransformer(size: CGSize(width: 300, height: 300), scaleMode: .aspectFit)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
        self.backgroundColor = UIColor(hex: "f2f2f2")
        self.cellContentView.layer.cornerRadius = 7
        favouriteButtonView.layer.cornerRadius = 14
        postImageView.contentMode = .scaleAspectFit
        postImageView.layer.cornerRadius = 7
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shortTextLabel.text = nil
        postImageView.image = nil
        postImageView.sd_cancelCurrentImageLoad()
        constraint = nil
    }
    
    private func configureLabel() {
        shortTextLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
    }
    
    public func configure(with model: NewsTableViewCellModel) {
        
        let text = model.text ?? "Новость не загрузилась"
        shortTextLabel.text = editted(text)
        if let url = model.imagesURL?.first {
            //postImageView.sd_setImage(with: url, completed: .none)
            postImageView.sd_setImage(with: url, placeholderImage: nil, options: [], context: [SDWebImageContextOption.imageTransformer: transformer])
        } else {
            postImageView.image = nil
        }
       let favouriteButtonTitle = model.isFavourite! ? "В ИЗБРАННОМ" : "+ ИЗБРАННОЕ"
       toFavouriteButton.setTitle(favouriteButtonTitle, for: .normal)
       isFavourite = model.isFavourite
    }
    
    @IBAction func toFavouritesButtonPressed(_ sender: Any) {
        
        if isFavourite {
            viewController.removeFromFavourites(at: indexPath)
        } else {
            viewController.addToFavourites(at: indexPath)
        }
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
