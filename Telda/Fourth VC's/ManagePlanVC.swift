//
//  ManagePlanVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 14/05/2024.
//

import UIKit

class ManagePlanVC: UIViewController {
    
    static var CellPressed:Int?

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
    
    @IBOutlet var ManagePlanCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ManagePlanCollectionView.delegate=self
        ManagePlanCollectionView.dataSource=self
        
        let nib = UINib(nibName: "SecondCategoriesCollectionCell", bundle: .main)
        ManagePlanCollectionView.register(nib, forCellWithReuseIdentifier: "SecondCategoriesCollectionCell")
        
        let nib1 = UINib(nibName: "ManagePlanCell", bundle: .main)
        ManagePlanCollectionView.register(nib1, forCellWithReuseIdentifier: "ManagePlanCell")
        
        let nib2=UINib(nibName: "ProfileHeader", bundle: nil)
        ManagePlanCollectionView.register(nib2, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
        
        
    }

    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

//MARK: - UICollectionViewDataSource
extension ManagePlanVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0{
            return 1
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let SecondCategoriesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCategoriesCollectionCell", for: indexPath) as! SecondCategoriesCollectionCell
        
        let ManagePlanCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ManagePlanCell", for: indexPath) as! ManagePlanCell
        
        if indexPath.section==0{
            SecondCategoriesCollectionCell.BigView.backgroundColor = .systemGray5
            SecondCategoriesCollectionCell.RightButton.isHidden=true
            SecondCategoriesCollectionCell.LeftButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
            SecondCategoriesCollectionCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "AccentColor")
            SecondCategoriesCollectionCell.CellLabel.text="Free plan"
            
            return SecondCategoriesCollectionCell

        }else{
            if indexPath.row==0{
                ManagePlanCell.TopLabel.text="Plus"
                ManagePlanCell.MidLabel.text="Trun heads with your transparent card & unlock extra benefits."
                ManagePlanCell.BottomLabel.text="EGP 29"
                ManagePlanCell.SmallView.backgroundColor = .myColor1

            }else{
                ManagePlanCell.TopLabel.text="Premium"
                ManagePlanCell.MidLabel.text="Enjoy financial freedom! Customize yout card& take full control of your financials."
                ManagePlanCell.BottomLabel.text="EGP 49"
                ManagePlanCell.SmallView.backgroundColor = .myColor3
            }
            return ManagePlanCell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
            
            DispatchQueue.main.async {
                if indexPath.section==0{
                    headerView.SectionLabel.text="Billing"
                }else{
                    headerView.SectionLabel.text="Upgrade"
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
    
}

//MARK: - UICollectionViewDelegate
extension ManagePlanVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section==1{
            if indexPath.row==0{
                DispatchQueue.main.async {
                    ManagePlanVC.CellPressed=0
                    let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
                    let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                    
                }
            }else{
                DispatchQueue.main.async {
                    ManagePlanVC.CellPressed=1
                    let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
                    let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ManagePlanVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=20
        flowLayout.sectionInset=UIEdgeInsets(top: 15, left: 0, bottom: 30, right: 0)
        
        if indexPath.section==0{
            return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/4-15)
        }else{
            return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/2-15)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 20) // Adjust the height as needed
    }
}
