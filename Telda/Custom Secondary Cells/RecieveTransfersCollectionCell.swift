//
//  RecieveTransfersCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 20/04/2024.
//

import UIKit

class RecieveTransfersCollectionCell: UICollectionViewCell {

    @IBOutlet var BigView: UIView!
    
    @IBOutlet var CellImage: UIButton!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabelButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

}
