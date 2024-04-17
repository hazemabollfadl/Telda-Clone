//
//  MoreCollectionViewCells.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 17/04/2024.
//

import UIKit

class MoreCollectionViewCells: UICollectionViewCell {

    @IBOutlet var CellImage: UIImageView!
    @IBOutlet var CellLabel: UILabel!
    @IBOutlet var SmallView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=20
    }

}
