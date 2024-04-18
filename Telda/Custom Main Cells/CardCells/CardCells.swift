//
//  CardCells.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit

protocol CardCellsButtonPressed{
    func ResetPinButtonPressed()
    func GetNewCardButtonPressed()
    func SendSwitch(_ mySwitch:UISwitch)
}

class CardCells: UITableViewCell {

    var delegate:CardCellsButtonPressed?
    
    @IBOutlet var LockCardSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func ResetPinButtonPressed(_ sender: UIButton) {
        delegate?.ResetPinButtonPressed()
    }
    
    @IBAction func GetNewCardButtonPressed(_ sender: UIButton) {
        delegate?.GetNewCardButtonPressed()
    }
    
    @IBAction func LockCardSwitchPressed(_ sender: UISwitch) {
        delegate?.SendSwitch(sender)
    }
}
