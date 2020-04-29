//
//  MarksTableViewCell.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 12.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import SDWebImage

class MarksTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
   
    @IBOutlet weak var cellContentView: UIView!
    
    weak var baseViewController: MarksViewInput!
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContentView.layer.cornerRadius = 5
        cellContentView.backgroundColor = .white
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        cellContentView.layer.shadowColor = UIColor.black.cgColor
        cellContentView.layer.shadowOpacity = 0.4
        cellContentView.layer.shadowOffset = .zero
        cellContentView.layer.shadowRadius = 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        iconImageView.image = nil
    }
    
    func configure(with model: Mark) {
        nameLabel.text = model.name
        iconImageView.sd_setImage(with: URL(string: model.iconURL)) { [weak self](image, error, cache, url) in
            guard let blockSelf = self else { return }
            blockSelf.baseViewController.reloadRows(at: [blockSelf.indexPath])
        }
    }
}
