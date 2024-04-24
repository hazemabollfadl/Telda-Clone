//
//  InsightDataCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 21/04/2024.
//

import UIKit

class InsightDataCell: UICollectionViewCell {

    
    @IBOutlet var BigView: UIView!
    
    @IBOutlet var CellBigLabel: UILabel!
    
    @IBOutlet var CellSmallLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

}
