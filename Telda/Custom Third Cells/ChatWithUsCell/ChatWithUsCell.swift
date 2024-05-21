//
//  ChatWithUsCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/05/2024.
//

import UIKit

class ChatWithUsCell: UITableViewCell {
    
    @IBOutlet var LeftImage: UIImageView!
    
    @IBOutlet var RightImage: UIImageView!
    
    @IBOutlet var MessageBubble: UIView!
    
    @IBOutlet var BigLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MessageBubble.layer.cornerRadius=MessageBubble.frame.size.height/5
    }
    
}
