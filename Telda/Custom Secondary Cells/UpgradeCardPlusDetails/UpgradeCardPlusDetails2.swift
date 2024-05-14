//
//  UpgradeCardPlusDetails2.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/05/2024.
//

import UIKit

class UpgradeCardPlusDetails2: UICollectionViewCell {
    
    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var CellHeader: UILabel!
    
    @IBOutlet var CellImage1: UIImageView!
    
    @IBOutlet var CellImage2: UIImageView!
    
    @IBOutlet var BigLabel1: UILabel!
    
    @IBOutlet var BigLabel2: UILabel!
    
    @IBOutlet var SmallLabel1: UILabel!
    
    @IBOutlet var SmallLabel2: UILabel!
        
    @IBOutlet var SmallLabel11: UILabel!
    
    @IBOutlet var SmallLabel12: UILabel!

    @IBOutlet var SmallLabel21: UILabel!
    
    @IBOutlet var SmallLabel22: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }
}
