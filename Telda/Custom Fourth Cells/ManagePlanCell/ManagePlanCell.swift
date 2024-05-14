//
//  ManagePlanCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 14/05/2024.
//

import UIKit

class ManagePlanCell: UICollectionViewCell {

    @IBOutlet var CellImage: UIImageView!
    
    @IBOutlet var TopLabel: UILabel!
    
    @IBOutlet var MidLabel: UILabel!
    
    @IBOutlet var BottomLabel: UILabel!
    
    
    @IBOutlet var RightLabel: UILabel!
    
    @IBOutlet var CellView: UIView!
    
    @IBOutlet var SmallView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CellView.layer.cornerRadius=15
        SmallView.layer.cornerRadius=15
        
        SmallView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
}
