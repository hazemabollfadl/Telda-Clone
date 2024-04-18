//
//  ProfilePlanAndEarnCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/04/2024.
//

import UIKit

class ProfilePlanAndEarnCollectionCell: UICollectionViewCell {
    
    @IBOutlet var BigView: UIView!
    @IBOutlet var Image: UIImageView!
    @IBOutlet var SmallText: UILabel!
    @IBOutlet var BigText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

}
