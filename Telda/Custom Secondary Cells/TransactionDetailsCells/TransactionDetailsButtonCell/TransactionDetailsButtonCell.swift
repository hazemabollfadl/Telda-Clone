//
//  TransactionDetailsButtonCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 09/05/2024.
//

import UIKit

protocol SplitAndPayLaterButtonsPressed{
    func splitWithOtherButtonPressed()
    func payLaterButtonPressed()
}
class TransactionDetailsButtonCell: UICollectionViewCell {
    var delegate:SplitAndPayLaterButtonsPressed?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func splitWithOtherButtonPressed(_ sender: UIButton) {
        delegate?.splitWithOtherButtonPressed()
    }
    
    @IBAction func payLaterButtonPressed(_ sender: UIButton) {
        delegate?.payLaterButtonPressed()
    }
    
}
