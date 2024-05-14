//
//  UpgradeCardPlusDetails.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/05/2024.
//

import UIKit

class UpgradeCardPlusDetails: UICollectionViewCell {

    @IBOutlet var CellHeader: UILabel!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabel: UILabel!
    
    @IBOutlet var SmallLabel1: UILabel!
    
    @IBOutlet var SmallLabel2: UILabel!
    
    @IBOutlet var CellButton: UIImageView!
    
    @IBOutlet var SmallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}
