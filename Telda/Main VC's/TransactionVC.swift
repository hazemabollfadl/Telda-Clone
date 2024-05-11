//
//  TransactionVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit
import AudioToolbox

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
                    
                    shake(NumberLabel)
                    
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
                        shake(NumberLabel)
                    }
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async { [self] in
            if NumberLabel.text?.count==5{
                shake(NumberLabel)
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
        let numberLabelCharacter = String(NumberLabel.text!.suffix(from: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)))
        
        let num = Int(numberLabelCharacter)
        
        if NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)] == "0"{
            ValidAmontLabel.text="Enter a valid Amount"
            ValidAmontLabel.isHidden=false
        }else if  num! < 5{
            ValidAmontLabel.text="Minimum amount is EGP 5"
            ValidAmontLabel.isHidden=false
        }else{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "RequestNavController") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let numberLabelCharacter = String(NumberLabel.text!.suffix(from: NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)))
        let num = Int(numberLabelCharacter)
        
        if NumberLabel.text![NumberLabel.text!.index(NumberLabel.text!.startIndex, offsetBy: 4)] == "0"{
            ValidAmontLabel.text="Enter a valid Amount"
            ValidAmontLabel.isHidden=false
        }else if  num! < 5{
            ValidAmontLabel.text="Minimum amount is EGP 5"
            ValidAmontLabel.isHidden=false
        }else{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "SendMoneyNavController") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
}

//MARK: - Usefull Functions
extension TransactionVC{
    func shake(_ label:UILabel){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: label.center.x - 7.5, y: label.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: label.center.x + 7.5, y: label.center.y))
        vibrate()
        label.layer.add(animation, forKey: "position")
    }
    
    func vibrate(){
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(1521)) { }
    }
}
