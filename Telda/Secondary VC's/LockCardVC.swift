//
//  LockCardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit

class LockCardVC: UIViewController {
    var lockCardPressed:Bool=false
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
            if !lockCardPressed{
                CardVC.vcSwitch?.isOn=false
            }
            SharedData.shared.overlayView.removeFromSuperview()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func lockCardPressed(_ sender: UIButton) {
        CardVC.vcSwitch?.isOn=true
        lockCardPressed=true
        self.dismiss(animated: true)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        CardVC.vcSwitch?.isOn=false
        self.dismiss(animated: true)
    }
}
