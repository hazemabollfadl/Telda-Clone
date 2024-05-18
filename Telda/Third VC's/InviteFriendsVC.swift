//
//  InviteFriendsVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit
import AudioToolbox

class InviteFriendsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func copyButtonPressed(_ sender: UIButton) {
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(1521)) { }
        let alert = UIAlertController(title: "Code copied", message: "", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.dismiss(animated: true)
        }
        
    }
    
    @IBAction func inviteFriendsButtonPressed(_ sender: UIButton) {
    }
    
}
