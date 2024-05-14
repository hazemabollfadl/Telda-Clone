//
//  ConfirmCardHolderNameVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/05/2024.
//

import UIKit

class ConfirmCardHolderNameVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var TextField: UITextField!
    
    var floatingButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        makingAButton(ButtonLabel: "Continue", BackgroundColor: .accent, TitleColor: .systemBackground)
        TextField.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.delegate=self
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
}

//MARK: - usefull functions
extension ConfirmCardHolderNameVC{
    func makingAButton(ButtonLabel label:String, BackgroundColor color:UIColor, TitleColor titleColor:UIColor){
        floatingButton = UIButton(type: .system)
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold) ]
        
        let myAttrString = NSAttributedString(string: label, attributes: myAttribute)
        floatingButton.setAttributedTitle(myAttrString, for: .normal)
        
        floatingButton.backgroundColor = color
        
        floatingButton.tintColor = titleColor
        
        floatingButton.layer.cornerRadius=15
        floatingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(floatingButton)
        
        // Add constraints for the floating button
        NSLayoutConstraint.activate([
            floatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            //            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingButton.widthAnchor.constraint(equalToConstant: view.bounds.width-32),
            floatingButton.heightAnchor.constraint(equalToConstant: view.bounds.width/6-16)
        ])
        
        
        // Initial position of the button
        let initialPosition = CGPoint(x: floatingButton.center.x, y: view.bounds.height + floatingButton.bounds.height / 2)
        
        // Final position of the button
        let finalPosition = CGPoint(x: floatingButton.center.x, y: view.bounds.height / 2)
        
        // Move the button to the initial position without animation
        floatingButton.center = initialPosition
        
        // Animate the button to the final position
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.floatingButton.center = finalPosition
        }, completion: nil)
        
    }
    @objc func buttonTapped() {
        
        if TextField.text==""{
            let alert = UIAlertController(title: "Warning", message: "Enter your name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .destructive))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let storyboard = UIStoryboard(name: "Third", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ConfirmAdressDeliveryVc") as! ConfirmAdressDeliveryVc
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 1
        
        UIView.animate(withDuration: duration) {
            self.floatingButton.frame.origin.y = keyboardFrame.minY - self.floatingButton.frame.height - 10
        }
    }
    
}
