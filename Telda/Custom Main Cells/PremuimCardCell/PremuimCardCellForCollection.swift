//
//  PremuimCardCellForCollection.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/04/2024.
//

import UIKit

protocol upgradeButtonPressed1{
    func upgradeButtonPressed()
}

class PremuimCardCellForCollection: UICollectionViewCell {

    @IBOutlet var BigView: UIView!
    var delegate:upgradeButtonPressed1?
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

    @IBAction func upgradeButtonPressed(_ sender: UIButton) {
        delegate?.upgradeButtonPressed()
    }
}
