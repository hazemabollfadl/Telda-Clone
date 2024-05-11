//
//  CardLabelCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 11/05/2024.
//

protocol getStartedButtonPressed{
    func getStartedButtonPressed()
}

import UIKit

class CardLabelCell: UICollectionViewCell {

    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var SmallLabel: UILabel!
    
    @IBOutlet var SmallLabel2: UILabel!
    
    @IBOutlet var CellButton: UIButton!
    
    var delegate:getStartedButtonPressed?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func cellButtonPressed(_ sender: UIButton) {
        delegate?.getStartedButtonPressed()
    }
}
