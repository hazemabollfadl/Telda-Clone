//
//  FeesVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet var SettingsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingsCollectionView.delegate=self
        SettingsCollectionView.dataSource=self
        
        let nib = UINib(nibName: "SecondCategoriesCollectionCell", bundle: .main)
        SettingsCollectionView.register(nib, forCellWithReuseIdentifier: "SecondCategoriesCollectionCell")
        
        let nib1=UINib(nibName: "ProfileHeader", bundle: nil)
        SettingsCollectionView.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
        let nib3 = UINib(nibName: "SettingsSecurityCell", bundle: .main)
        SettingsCollectionView.register(nib3, forCellWithReuseIdentifier: "SettingsSecurityCell")
        
         
        let nib4 = UINib(nibName: "SettingsHideBalanceCell", bundle: .main)
        SettingsCollectionView.register(nib4, forCellWithReuseIdentifier: "SettingsHideBalanceCell")
        
        
        
    }
    
    
}

//MARK: - UICollectionViewDataSource
extension SettingsVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0{
            return 2
        }else if section==1{
            return 6
        }else if section==2{
            return 6
        }else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let SecondCategoriesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCategoriesCollectionCell", for: indexPath) as! SecondCategoriesCollectionCell
        
        let SettingsSecurityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsSecurityCell", for: indexPath) as! SettingsSecurityCell
        SettingsSecurityCell.delegate=self
          
        let SettingsHideBalanceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsHideBalanceCell", for: indexPath) as! SettingsHideBalanceCell
        SettingsHideBalanceCell.delegate=self
        
        if SharedData.shared.select==true{
            SettingsHideBalanceCell.CellSwitch.isOn=true
        }
        
        
        SecondCategoriesCollectionCell.BigView.backgroundColor = .systemGray5
        SecondCategoriesCollectionCell.CellLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        SecondCategoriesCollectionCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "AccentColor")
        SecondCategoriesCollectionCell.CellLabel.textColor = .label
        
        SecondCategoriesCollectionCell.LeftButton.setPreferredSymbolConfiguration(.init(pointSize: 17), forImageIn: .normal)
        
        
        if indexPath.section==0{
            if indexPath.row==0{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "person"), for: .normal)

                SecondCategoriesCollectionCell.CellLabel.text="Personal Details"
                SecondCategoriesCollectionCell.RightButton.isHidden=false
                
            }else{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "location"), for: .normal)
                
                SecondCategoriesCollectionCell.CellLabel.text="Delivery Address"
                SecondCategoriesCollectionCell.RightButton.isHidden=false
                
            }
            return SecondCategoriesCollectionCell
            
        }else if indexPath.section==1{
            
            if indexPath.row==0{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "lock.iphone"), for: .normal)
                SecondCategoriesCollectionCell.CellLabel.text="Change Passcode"
                SecondCategoriesCollectionCell.RightButton.isHidden=false
                
            }else if indexPath.row==1{
                return SettingsSecurityCell
                
            }else if indexPath.row==2{
               return SettingsHideBalanceCell
                
            }else if indexPath.row==3{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "shield.checkered"), for: .normal)
                SecondCategoriesCollectionCell.CellLabel.text="Security Tips"
                SecondCategoriesCollectionCell.RightButton.isHidden=true
                
            }else if indexPath.row==4{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "circle.slash"), for: .normal)
                SecondCategoriesCollectionCell.CellLabel.text="Blocked users"
                SecondCategoriesCollectionCell.RightButton.isHidden=false
                
            }else{
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "square.grid.3x3"), for: .normal)
                SecondCategoriesCollectionCell.CellLabel.text="Connected Apps"
                SecondCategoriesCollectionCell.RightButton.isHidden=false
                
            }
            return SecondCategoriesCollectionCell
            
        }else if indexPath.section==2{
            SecondCategoriesCollectionCell.RightButton.isHidden=true
            
            if indexPath.row==0{
                SecondCategoriesCollectionCell.CellLabel.text="Rate us on the App store"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "star.circle"), for: .normal)
            }else if indexPath.row==1{
                SecondCategoriesCollectionCell.CellLabel.text="Like us on Facebook"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "f.circle"), for: .normal)
            }else if indexPath.row==2{
                SecondCategoriesCollectionCell.CellLabel.text="Follow us on X"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
            }else if indexPath.row==3{
                SecondCategoriesCollectionCell.CellLabel.text="Follow us on Instagram"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "i.circle"), for: .normal)
            }else if indexPath.row==4{
                SecondCategoriesCollectionCell.CellLabel.text="Privacy Policy"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "shield.checkered"), for: .normal)
            }else{
                SecondCategoriesCollectionCell.CellLabel.text="Terms & Conditions"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "newspaper"), for: .normal)
            }
            return SecondCategoriesCollectionCell
            
        }else{
            SecondCategoriesCollectionCell.RightButton.isHidden=true
            if indexPath.row==0{
                SecondCategoriesCollectionCell.CellLabel.text="Close account"
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "heart.slash"), for: .normal)
            }else{
                SecondCategoriesCollectionCell.CellLabel.text="Logout"
                SecondCategoriesCollectionCell.CellLabel.textColor = .systemRed
                SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
                SecondCategoriesCollectionCell.LeftButton.configuration?.baseForegroundColor = .systemRed
            }
            return SecondCategoriesCollectionCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
            
            DispatchQueue.main.async {
                if indexPath.section==0{
                    headerView.SectionLabel.text="Profile"
                }else if indexPath.section==1{
                    headerView.SectionLabel.text="Security"
                }else if indexPath.section==2{
                    headerView.SectionLabel.text="About us"
                }else{
                    headerView.SectionLabel.text="Logout"
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension SettingsVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section==0{
            if indexPath.row==0{
                performSegue(withIdentifier: "SettingsToPersonalDetails", sender: self)
            }else{
                performSegue(withIdentifier: "SettingsToWhereDoYouLive", sender: self)
            }
        }else if indexPath.section==1{
            if indexPath.row==0{
                performSegue(withIdentifier: "SettingsToCurrentPassCode", sender: self)
            }else if indexPath.row==4{
                performSegue(withIdentifier: "SettingsToBlockedUsers", sender: self)
            }else if indexPath.row==5{
                performSegue(withIdentifier: "SettingsToConnectedApps", sender: self)
            }
        }else if indexPath.section==3{
            if indexPath.row==0{
                performSegue(withIdentifier: "SettingsToCloseAccount", sender: self)
            }else{
                let alert = UIAlertController(title: "Confirm", message: "Are you sure you want to logout?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
                    self.dismiss(animated: true)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SettingsVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=5
        flowLayout.sectionInset=UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/5-10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 50) // Adjust the height as needed
    }
}


//MARK: - settingsSwitchButtonPressed protcol
extension SettingsVC:settingsFacIDSwitchButtonPressed{
    func settingsFacIDSwitchButtonPressed(_ mySwitch: UISwitch) {
        if mySwitch.isOn{
            let alert = UIAlertController(title: "Sign in with Face ID is on", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true)
            }
        }

    }
}

//MARK: - settingsHideBalanceSwitchButtonPressed protcol
extension SettingsVC:settingsHideBalanceSwitchButtonPressed{
    func settingsHideBalanceSwitchButtonPressed(_ mySwitch: UISwitch) {
        if mySwitch.isOn{
            SharedData.shared.select=true
            let alert = UIAlertController(title: "Hide balance is on", message: "", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.dismiss(animated: true)
            }
        }else{
            SharedData.shared.select=false
        }
    }
}
