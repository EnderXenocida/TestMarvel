//
//  HomeCollectionViewCell.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

struct HomeCellStruct {
    let image: String?
    let name: String?
}

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ data: HomeCellStruct) {
        thumbnailImageView.loadRemoteImage(data.image)
        nameLabel.text = data.name
    }

}
