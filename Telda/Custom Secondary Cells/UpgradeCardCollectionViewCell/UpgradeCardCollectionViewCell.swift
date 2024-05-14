//
//  UpgradeCardCollectionViewCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/05/2024.
//

import UIKit

class UpgradeCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var BigLabel: UILabel!
    @IBOutlet var SmallLabel: UILabel!
    @IBOutlet var SmallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}
