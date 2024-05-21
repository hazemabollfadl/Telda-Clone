//
//  AppAppearanceCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/05/2024.
//

import UIKit

class AppAppearanceCell: UICollectionViewCell {

    @IBOutlet var CellImage: UIImageView!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var CheckMark: UIImageView!
    
    @IBOutlet var SmallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}
