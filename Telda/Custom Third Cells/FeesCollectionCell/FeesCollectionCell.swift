//
//  FeesCollectionCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 13/05/2024.
//

import UIKit

class FeesCollectionCell: UICollectionViewCell {

    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var LeftLabel: UILabel!
    
    @IBOutlet var RightLabel: UILabel!
    
    @IBOutlet var SmallLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SmallView.layer.cornerRadius=15
    }

}


extension FeesCollectionCell{
    func roundCorners(corners: UIRectCorner, radius: CGFloat, bounds: CGRect, layer: CALayer) {
           let maskPath = UIBezierPath(roundedRect: bounds,
                                       byRoundingCorners: corners,
                                       cornerRadii: CGSize(width: radius, height: radius))
           
           let maskLayer = CAShapeLayer()
           maskLayer.frame = bounds
           maskLayer.path = maskPath.cgPath
           
           layer.mask = maskLayer
       }
}
