//
//  TrashTableViewCell.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class TrashTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = ""
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
    }
}
