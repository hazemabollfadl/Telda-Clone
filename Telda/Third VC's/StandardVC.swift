//
//  StandardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class StandardVC: UIViewController {

    @IBOutlet var SmallView: UIView!
    
    @IBOutlet var SmallView2: UIView!
    
    @IBOutlet var ScrollViewHeightConstraint: NSLayoutConstraint!
    
    override func viewIsAppearing(_ animated: Bool) {
        
        if UpgradeCardVC.isPressedInUpgrade==true{
            
//            GetNewCardVC.NewCardCurrentPage=1
            
            GetNewCardVC.NonAutomatedRouteDismiss=false
            
            UpgradeCardVC.isPressedInUpgrade=false
            
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ChooseCardNavController") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            
            CardVC.AutomatedNavigation=true
            
            self.present(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title="Standard"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22,weight: .semibold) // Change the font size as needed
              ]

        SmallView.layer.cornerRadius=15
        SmallView2.layer.cornerRadius=15
        
        ScrollViewHeightConstraint.constant=view.bounds.width*2-10
    }
    

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
   
    @IBAction func upgradeButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    @IBAction func manageButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Fourth", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ManagePlanVC") as! ManagePlanVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
}
