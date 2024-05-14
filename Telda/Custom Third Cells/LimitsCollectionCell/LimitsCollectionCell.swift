//
//  LimitsCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 13/05/2024.
//

import UIKit

class LimitsCollectionCell: UICollectionViewCell {

    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var HeadLabel: UILabel!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabel1: UILabel!
    
    @IBOutlet var ProgressBar: UIProgressView!
    
    @IBOutlet var SmallLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}
