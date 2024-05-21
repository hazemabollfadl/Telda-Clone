//
//  AppAppearanceVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class AppAppearanceVC: UIViewController {
    
    @IBOutlet var AppAppearanceCollectionView: UICollectionView!
    
    var selected:Bool=false
    
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
        
        AppAppearanceCollectionView.delegate=self
        AppAppearanceCollectionView.dataSource=self
        
        let nib = UINib(nibName: "AppAppearanceCell", bundle: .main)
        AppAppearanceCollectionView.register(nib, forCellWithReuseIdentifier: "AppAppearanceCell")
    }
    
}

//MARK: - UICollectionViewDataSource
extension AppAppearanceVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let AppAppearanceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppAppearanceCell", for: indexPath) as! AppAppearanceCell
        
        
        if indexPath.row==0{
            AppAppearanceCell.BigLabel.text="Standard"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .accent
        }else if indexPath.row==1{
            AppAppearanceCell.BigLabel.text="Palestine"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .systemRed
            AppAppearanceCell.CheckMark.isHidden=true
            
        }else if indexPath.row==2{
            AppAppearanceCell.BigLabel.text="Plus"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .myColor1
            AppAppearanceCell.CheckMark.image = UIImage(systemName: "lock.circle.fill")
            AppAppearanceCell.CheckMark.tintColor = .systemGray
            
        }else if indexPath.row==3{
            AppAppearanceCell.BigLabel.text="Pink Saas"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .myColor6
            AppAppearanceCell.CheckMark.image = UIImage(systemName: "lock.circle.fill")
            AppAppearanceCell.CheckMark.tintColor = .systemGray

            

            
        }else if indexPath.row==4{
            AppAppearanceCell.BigLabel.text="Midnight Blue"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .myColor4
            AppAppearanceCell.CheckMark.image = UIImage(systemName: "lock.circle.fill")
            AppAppearanceCell.CheckMark.tintColor = .systemGray


            
        }else{
            AppAppearanceCell.BigLabel.text="Electric Lime"
            AppAppearanceCell.CellImage.image = UIImage(systemName: "bolt.horizontal.circle.fill")
            AppAppearanceCell.CellImage.tintColor = .myColor3
            AppAppearanceCell.CheckMark.image = UIImage(systemName: "lock.circle.fill")
            AppAppearanceCell.CheckMark.tintColor = .systemGray


            
        }
        
        return AppAppearanceCell
    }
    
    
    
    
}

//MARK: - UICollectionViewDelegate
extension AppAppearanceVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let AppAppearanceCell1stCell = collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as! AppAppearanceCell
        let AppAppearanceCell2ndCell = collectionView.cellForItem(at: IndexPath(row: 1, section: 0)) as! AppAppearanceCell
        
        if indexPath.row==0{
            if AppAppearanceCell1stCell.CheckMark.isHidden==true{
                AppAppearanceCell2ndCell.CheckMark.isHidden=true
                let alert = UIAlertController(title: "You have changed the icon to 'Standard'", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "okay", style: .cancel))
                self.present(alert, animated: true, completion: nil)
                AppAppearanceCell1stCell.CheckMark.isHidden=false
                
            }
        }else if indexPath.row==1{
            if AppAppearanceCell2ndCell.CheckMark.isHidden==true{
                AppAppearanceCell1stCell.CheckMark.isHidden=true
                let alert = UIAlertController(title: "You have changed the icon to 'Palestine'", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "okay", style: .cancel))
                self.present(alert, animated: true, completion: nil)
                AppAppearanceCell2ndCell.CheckMark.isHidden=false
                
            }
        }else{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
        
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension AppAppearanceVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=5
        flowLayout.sectionInset=UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/5-10)
        
    }
}

