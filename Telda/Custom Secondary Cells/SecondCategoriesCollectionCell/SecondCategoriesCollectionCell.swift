//
//  SecondCategoriesCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 24/04/2024.
//

import UIKit

class SecondCategoriesCollectionCell: UICollectionViewCell {
    
    @IBOutlet var BigView: UIView!
    
    @IBOutlet var LeftButton: UIButton!
    
    @IBOutlet var RightButton: UIButton!
    
    @IBOutlet var CellLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BigView.layer.cornerRadius=15
        LeftButton.isUserInteractionEnabled=false
        
        RightButton.isUserInteractionEnabled=false
        
    }
    
}
