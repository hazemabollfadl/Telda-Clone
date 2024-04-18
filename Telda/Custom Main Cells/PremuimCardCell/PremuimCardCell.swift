//
//  PremuimCardCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
import UIKit

protocol upgradeButtonPressed{
    func upgradeButtonPressed()
}

class PremuimCardCell: UITableViewCell {

    var delegate: upgradeButtonPressed?

    @IBOutlet var BigView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=10
    }
    
    @IBAction func upgradeButtonPressed(_ sender: UIButton) {
        delegate?.upgradeButtonPressed()
    }
    
}
