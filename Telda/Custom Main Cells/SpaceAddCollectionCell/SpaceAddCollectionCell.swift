//
//  SpaceAddCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/04/2024.
//

import UIKit

protocol CustomCollectionCellDelegate: AnyObject {
    func addButtonPressed()
}

class SpaceAddCollectionCell: UICollectionViewCell {
    
    weak var delegate: CustomCollectionCellDelegate?

    @IBOutlet var bigView: UIView!
    @IBOutlet var smallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bigView.layer.cornerRadius=15
        smallView.layer.cornerRadius=10
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        delegate?.addButtonPressed()
    }
    
}
