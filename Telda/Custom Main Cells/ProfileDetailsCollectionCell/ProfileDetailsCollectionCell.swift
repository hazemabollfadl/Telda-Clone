//
//  ProfileDetailsCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 18/04/2024.
//

import UIKit

class ProfileDetailsCollectionCell: UICollectionViewCell {

    @IBOutlet var BigView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        BigView.layer.cornerRadius=15
    }

}
