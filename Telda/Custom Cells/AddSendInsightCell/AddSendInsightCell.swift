//
//  AddSendInsightCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func addMoneyButtonPressed()
    func sendMoneyButtonPressed()
    func insightButtonPressed()
    
}


class AddSendInsightCell: UITableViewCell {

    weak var delegate: CustomTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    @IBAction func AddMoneyPressed(_ sender: UIButton){
        delegate?.addMoneyButtonPressed()

    }
    @IBAction func SendMoneyPressed(_ sender: UIButton) {
        delegate?.sendMoneyButtonPressed()
    }
    @IBAction func InsightPressed(_ sender: UIButton) {
        delegate?.insightButtonPressed()
    }
    
}
