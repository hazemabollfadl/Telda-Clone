//
//  ProfileVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

class UserProfileVC: UIViewController {
    
    @IBOutlet var UserProfileCollectionView: UICollectionView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles=false

    }
    
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
        
        UserProfileCollectionView.delegate=self
        UserProfileCollectionView.dataSource=self
        
        
        let nib=UINib(nibName: "ProfileDetailsCollectionCell", bundle: .main)
        UserProfileCollectionView.register(nib, forCellWithReuseIdentifier: "ProfileDetailsCollectionCell")
        
        let nib1=UINib(nibName: "ProfilePlanAndEarnCollectionCell", bundle: .main)
        UserProfileCollectionView.register(nib1, forCellWithReuseIdentifier: "ProfilePlanAndEarnCollectionCell")
        
        let nib3=UINib(nibName: "PremuimCardCellForCollection", bundle: .main)
        UserProfileCollectionView.register(nib3, forCellWithReuseIdentifier: "PremuimCardCellForCollection")
        
        let nib4=UINib(nibName: "ProfileHeader", bundle: nil)
        UserProfileCollectionView.register(nib4, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
        let nib5=UINib(nibName: "ProfileUsageAndManageCell", bundle: nil)
        UserProfileCollectionView.register(nib5, forCellWithReuseIdentifier: "ProfileUsageAndManageCell")
        
        UserProfileCollectionView.showsVerticalScrollIndicator=false
        
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

//MARK: - UICollectionViewDiffableDataSource
extension UserProfileVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0{
            return 4
        }else if section==1{
            return 2
        }else{
            return 3
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = UserProfileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileDetailsCollectionCell", for: indexPath) as! ProfileDetailsCollectionCell
        
        let cell2 = UserProfileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePlanAndEarnCollectionCell", for: indexPath) as! ProfilePlanAndEarnCollectionCell
        
        let cell3 = UserProfileCollectionView.dequeueReusableCell(withReuseIdentifier: "PremuimCardCellForCollection", for: indexPath) as! PremuimCardCellForCollection
        cell3.delegate=self
        
        let cell4 = UserProfileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileUsageAndManageCell", for: indexPath) as! ProfileUsageAndManageCell
        
        if indexPath.section==0{
            if indexPath.row==0{
                return cell1
            }else if indexPath.row==1 || indexPath.row==2{
                if indexPath.row==2{
                    cell2.SmallText.text="Invite friends"
                    cell2.BigText.text="Earn Cash"
                    cell2.Image.image=UIImage(systemName: "creditcard.trianglebadge.exclamationmark.fill")
                }
                return cell2
            }else{
                return cell3
            }
        }else if indexPath.section==1{
            if indexPath.row==1{
                cell4.BigLabel.text="Fees"
                cell4.SmallLabel.text="Details of fees breakdown"
                cell4.CellButton.setImage(UIImage(systemName: "menucard.fill"), for: .normal)
            }
            return cell4
        }
        else{
            if indexPath.row==0{
                cell4.BigLabel.text="App apperance"
                cell4.SmallLabel.text="Customize your app"
                cell4.CellButton.setImage(UIImage(systemName: "paintpalette.fill"), for: .normal)
            }
            if indexPath.row==1{
                cell4.BigLabel.text="Settings"
                cell4.SmallLabel.text="Personal Indormation, app & Security"
                cell4.CellButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
            }
            if indexPath.row==2{
                cell4.BigLabel.text="Help"
                cell4.SmallLabel.text="Get support and feedback"
                cell4.CellButton.setImage(UIImage(systemName: "bubble.left.and.bubble.right.fill"), for: .normal)
            }
            
            return cell4
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
            DispatchQueue.main.async {
                if indexPath.section==0{
                    headerView.SectionLabel.text=""
                }else if indexPath.section==1{
                    headerView.SectionLabel.text="Usage"
                }else if indexPath.section==2{
                    headerView.SectionLabel.text="Manage"
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension UserProfileVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.section==0{
            if indexPath.row==1{
                
                performSegue(withIdentifier: "ProfileToStandard", sender: self)
                navigationController?.navigationBar.prefersLargeTitles=true
                
            }else if indexPath.row==2{
                performSegue(withIdentifier: "UserProfileToInviteFriends", sender: self)
            }
        }
        
        if indexPath.section==1{
            if indexPath.row==0{
                performSegue(withIdentifier: "UserProfileToLimits", sender: self)
            }
            else{
                performSegue(withIdentifier: "UserProfileToFees", sender: self)
            }
        }
        
        if indexPath.section==2{
            if indexPath.row==0{
                performSegue(withIdentifier: "UserProfileToAppAppearance", sender: self)
            }else if indexPath.row==1{
                performSegue(withIdentifier: "UserProfileToSettings", sender: self)
            }else{
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Third", bundle: nil)
                    let vc  = storyboard.instantiateViewController(withIdentifier: "ChatWithUsVC") as! ChatWithUsVC
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
        
    }
    
    
}

extension UserProfileVC:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.minimumLineSpacing=20
        flowLayout.minimumInteritemSpacing=10
        
        flowLayout.sectionInset=UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        
        if indexPath.section==0{
            if indexPath.row == 0{
                return CGSize(width: (collectionView.bounds.width), height: 100)
                
            }else if indexPath.row==1 || indexPath.row==2{
                return CGSize(width: (collectionView.bounds.width/2)-5, height: (collectionView.bounds.width/2)-30)
                
            }else{
                return CGSize(width: (collectionView.bounds.width), height: 150)
                
            }
        }else{
            return CGSize(width: (collectionView.bounds.width), height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section==0{
            return CGSize()
        }else{
            return CGSize(width: collectionView.frame.width, height: 50) // Adjust the height as needed
        }
    }
}

//MARK: - upgradeButtonPressed1
extension UserProfileVC:upgradeButtonPressed1{
    func upgradeButtonPressed() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    
}
