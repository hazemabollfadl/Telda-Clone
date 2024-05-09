//
//  ProfileUsageAndManageCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/04/2024.
//

import UIKit

class ProfileUsageAndManageCell: UICollectionViewCell {

    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabel: UILabel!
    
    @IBOutlet var CellButton: UIButton!
    
    @IBOutlet var CellArrowButton: UIButton!
    
    @IBOutlet var BigView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
        CellButton.isUserInteractionEnabled=false
        CellArrowButton.isUserInteractionEnabled=false
    }

    @IBAction func CellButtonPressed(_ sender: UIButton) {
    }
}
