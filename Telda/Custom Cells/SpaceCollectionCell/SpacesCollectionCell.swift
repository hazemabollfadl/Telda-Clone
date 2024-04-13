//
//  SpacesCollectionCellCollectionViewCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 11/04/2024.
//

import UIKit

class SpacesCollectionCell: UICollectionViewCell {
    
    @IBOutlet var bigView: UIView!
    @IBOutlet var smallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bigView.layer.cornerRadius=15
        smallView.layer.cornerRadius=10
    }

}
