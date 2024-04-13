//
//  TransactionVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

class TransactionVC: UIViewController {
    
    var counter=false
    
    @IBOutlet var ValidAmontLabel: UILabel!
    @IBOutlet var NumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ValidAmontLabel.isHidden=true
        
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        DispatchQueue.main.async { [self] in
            if let senderText = sender.titleLabel?.text{
                
                if (senderText == "." || senderText == "0") && (NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)] == "0"){
                    
                    print("Enter a valid number")
                    
                }else{
                    
                    ValidAmontLabel.isHidden=true
                    
                    if counter==false{
                        NumberLabel.text?.removeLast()
                        counter=true
                    }
                    
                    if NumberLabel.text!.count < 10{
                        NumberLabel.alpha=1
                        NumberLabel.text! += senderText
                        
                        if NumberLabel.text?.count == 8{
                            NumberLabel.text?.insert(",", at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 5))
                        }
                        
                        if NumberLabel.text?.count == 10{
                            NumberLabel.text?.remove(at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 5))
                            
                            NumberLabel.text?.insert(",", at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 6))
                        }
                    }else{
                        print("Can't Add more")
                    }
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async { [self] in
            if NumberLabel.text?.count==5{
                print("Can't remove more")
                counter=false
                NumberLabel.alpha=0.3
                NumberLabel.text = "EGP 0"
            }else{
                NumberLabel.text?.removeLast()
                if NumberLabel.text?.count == 9{
                    NumberLabel.text?.remove(at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 6))
                    
                    NumberLabel.text?.insert(",", at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 5))
                }
                if NumberLabel.text?.count == 8{
                    NumberLabel.text?.remove(at: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 5))
                }

            }
        }
    }
    @IBAction func requestButtonPressed(_ sender: UIButton) {
        let numberLabelCharacter = String(NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)])
        
        let num = Int(numberLabelCharacter)
        
        if NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)] == "0" || num! < 5{
            ValidAmontLabel.isHidden=false
        }else{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "TransactionDetailsVC") as! TransactionDetailsVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let numberLabelCharacter = String(NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)])
        let num = Int(numberLabelCharacter)
        
        if NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)] == "0" || num! < 5{
            ValidAmontLabel.isHidden=false
        }else{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "SendMoneyVC") as! SendMoneyVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
}
