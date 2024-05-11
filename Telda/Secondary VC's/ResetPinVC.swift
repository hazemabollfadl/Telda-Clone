//
//  ResetPinVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit
import AEOTPTextField

class ResetPinVC: UIViewController {

    @IBOutlet var PinTextField: AEOTPTextField!
    
    override func viewDidAppear(_ animated: Bool) {
        PinTextField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        PinTextField.otpDelegate=self
        PinTextField.configure(with: 8)
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}

//MARK: - AEOTPTextFieldDelegate
extension ResetPinVC:AEOTPTextFieldDelegate{
    func didUserFinishEnter(the code: String) {
        
        performSegue(withIdentifier: "PinToSetANewPin", sender: self)
    }
    
    
}
