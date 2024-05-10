//
//  TransactionTextFieldTableViewCell.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 10/05/2024.
//

import UIKit

class TransactionTextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var BigLabel: UILabel!
    
    @IBOutlet var TextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TextField.delegate=self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
