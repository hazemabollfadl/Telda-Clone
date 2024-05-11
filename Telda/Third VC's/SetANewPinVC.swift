//
//  SetANewPinVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 11/05/2024.
//

import UIKit
import AEOTPTextField

class SetANewPinVC: UIViewController {
    
    @IBOutlet var SetAPinTextField: AEOTPTextField!
    
    override func viewDidAppear(_ animated: Bool) {
        SetAPinTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetAPinTextField.otpDelegate=self
        
        SetAPinTextField.configure(with: 4)

        navigationController?.setNavigationBarHidden(false, animated: true)
        
      
    }
}

//MARK: - AEOTPTextFieldDelegate
extension SetANewPinVC:AEOTPTextFieldDelegate{
    func didUserFinishEnter(the code: String) {
        let alert = UIAlertController(title: "Warning", message: "Card pin have been reseted", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
