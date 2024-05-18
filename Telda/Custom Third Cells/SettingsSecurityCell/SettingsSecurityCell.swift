//
//  SettingsSecurityCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/05/2024.
//

import UIKit

protocol settingsFacIDSwitchButtonPressed{
    func settingsFacIDSwitchButtonPressed(_ mySwitch:UISwitch)
}

class SettingsSecurityCell: UICollectionViewCell {

    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var CellImage: UIImageView!
    
    var delegate:settingsFacIDSwitchButtonPressed?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

    @IBAction func switchButtonFaceIDPressed(_ sender: UISwitch) {
        delegate?.settingsFacIDSwitchButtonPressed(sender)
    }
}
