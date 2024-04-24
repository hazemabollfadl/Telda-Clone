//
//  InsightSetBudgetCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 21/04/2024.
//

import UIKit

class InsightSetBudgetCell: UICollectionViewCell {

    @IBOutlet var BigView: UIView!
    
    @IBOutlet var LeftButton: UIButton!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabel: UILabel!
    
    @IBOutlet var RightButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

}
