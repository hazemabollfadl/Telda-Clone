//
//  SpacesPlanupCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 09/05/2024.
//

import UIKit

class SpacesPlanupCell: UICollectionViewCell {

    @IBOutlet var SmallView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}