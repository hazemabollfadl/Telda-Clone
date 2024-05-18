//
//  SettingsHideBalanceCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/05/2024.
//

import UIKit

protocol settingsHideBalanceSwitchButtonPressed{
    func settingsHideBalanceSwitchButtonPressed(_ mySwitch:UISwitch)
}

class SettingsHideBalanceCell: UICollectionViewCell {
    
    var delegate:settingsHideBalanceSwitchButtonPressed?

    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var CellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

    @IBAction func switchButtonHideBalancePressed(_ sender: UISwitch) {
        delegate?.settingsHideBalanceSwitchButtonPressed(sender)
    }
}
