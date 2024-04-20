//
//  SpacesCollectionCellCollectionViewCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 11/04/2024.
//

import UIKit

protocol sendPriceLabel{
    func sendPriceLabel(_ label:BlurText)
}

class SpacesCollectionCell: UICollectionViewCell {
    
    @IBOutlet var bigView: UIView!
    @IBOutlet var smallView: UIView!
    @IBOutlet var spacesPriceLabel: BlurText!
    
    var delegate:sendPriceLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bigView.layer.cornerRadius=15
        smallView.layer.cornerRadius=10
    }
    
    func sendDelegate(){
        delegate?.sendPriceLabel(spacesPriceLabel)
    }

}
