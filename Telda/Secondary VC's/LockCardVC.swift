//
//  LockCardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit

class LockCardVC: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
            CardVC.vcSwitch?.isOn=false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
