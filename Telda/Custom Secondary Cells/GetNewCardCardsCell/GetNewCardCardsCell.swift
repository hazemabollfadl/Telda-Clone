//
//  GetNewCardCardsCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 11/05/2024.
//

import UIKit

class GetNewCardCardsCell: UICollectionViewCell {

    @IBOutlet var CardImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        CardImage.transform = CGAffineTransformMakeRotation(.pi/2)
    }

}
