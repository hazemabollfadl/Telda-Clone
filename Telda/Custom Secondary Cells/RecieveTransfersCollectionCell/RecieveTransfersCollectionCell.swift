//
//  RecieveTransfersCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 20/04/2024.
//

import UIKit

protocol instantButtonPressed{

    func instantButtonPressed()
}

class RecieveTransfersCollectionCell: UICollectionViewCell {

    var delegate:instantButtonPressed?
    
    @IBOutlet var BigView: UIView!
    
    @IBOutlet var CellImage: UIButton!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabelButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
        
        CellImage.alpha=1
        SmallLabelButton.alpha=1
        
//        SmallLabelButton.imageDimsWhenDisabled=fals
        
        
        
        
    }
    @IBAction func cellButtonPressed(_ sender: UIButton) {
        delegate?.instantButtonPressed()
    }
    
}
