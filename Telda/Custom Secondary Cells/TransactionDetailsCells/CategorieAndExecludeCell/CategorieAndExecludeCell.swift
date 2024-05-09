//
//  TransactionDetailsCategorie+ExecludeCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 09/05/2024.
//

import UIKit

protocol sendCellItems {
    func categoriesButtonPressed()
    func sendSwitch(_ mySwitch:UISwitch)
}

class CategorieAndExecludeCell: UICollectionViewCell {

    var delegate:sendCellItems?
    
    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var ExecludeSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

    @IBAction func categoriesButtonPressed(_ sender: UIButton) {
        delegate?.categoriesButtonPressed()
        
    }
    

    @IBAction func execludeSwitchPressed(_ sender: UISwitch) {
        delegate?.sendSwitch(sender)
    }
}
