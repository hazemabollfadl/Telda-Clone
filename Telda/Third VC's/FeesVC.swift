//
//  FeesVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class FeesVC: UIViewController {
    
    
    @IBOutlet var FeesCollectionView: UICollectionView!
    
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeesCollectionView.delegate=self
        FeesCollectionView.dataSource=self
        
        let nib = UINib(nibName: "FeesCollectionCell", bundle: .main)
        FeesCollectionView.register(nib, forCellWithReuseIdentifier: "FeesCollectionCell")
        
        let nib1=UINib(nibName: "ProfileHeader", bundle: nil)
        FeesCollectionView.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
        
        FeesCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    
}

//MARK: - UICollectionViewDataSource
extension FeesVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0{
            return 4
        }else if section==1{
            return 1
        }else if section==2{
            return 4
        }else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let FeesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeesCollectionCell", for: indexPath) as! FeesCollectionCell
        
        if indexPath.section==0{
            FeesCollectionCell.SmallLabel.isHidden=true
            if indexPath.row==0{
                FeesCollectionCell.LeftLabel.text="First Telda card"
                FeesCollectionCell.RightLabel.text="EGP 99"
                
            }else if indexPath.row==1{
                FeesCollectionCell.LeftLabel.text="Monthly/Yearly fees"
                FeesCollectionCell.RightLabel.text="Free"
            }else if indexPath.row==2{
                FeesCollectionCell.LeftLabel.text="Telda card replacment after expiry"
                FeesCollectionCell.RightLabel.text="EGP 99"
            }else{
                FeesCollectionCell.LeftLabel.text="Telda card replacment Before expiry"
                FeesCollectionCell.RightLabel.text="EGP 99"
                
            }
        }else if indexPath.section==1{
            FeesCollectionCell.SmallLabel.isHidden=true
                FeesCollectionCell.LeftLabel.text="Instant transfers to Telda users"
                FeesCollectionCell.RightLabel.text="Free"
            
        }else if indexPath.section==2{
             if indexPath.row==0{
                FeesCollectionCell.LeftLabel.text="Local card purchases"
                FeesCollectionCell.RightLabel.text="Free"
                FeesCollectionCell.SmallLabel.isHidden=true
            }else if indexPath.row==1{
                FeesCollectionCell.LeftLabel.text="BDC ATM withdrawls"
                FeesCollectionCell.RightLabel.text="EGP 5"
                FeesCollectionCell.SmallLabel.text="Banque De Caire ATM withdrawls"
                FeesCollectionCell.SmallLabel.isHidden=false


            }else if indexPath.row==2{
                FeesCollectionCell.LeftLabel.text="Other local ATM withdrawls"
                FeesCollectionCell.RightLabel.text="EGP 5"
                FeesCollectionCell.SmallLabel.text="A flat fee applies when you withdraw cash from any other local ATM"
                FeesCollectionCell.SmallLabel.isHidden=false


            }else{
                FeesCollectionCell.LeftLabel.text="International card purchases"
                FeesCollectionCell.RightLabel.text="10%"
                FeesCollectionCell.SmallLabel.text="A foreign currency exchange markup on spending with your card in any foreign currency"
                FeesCollectionCell.SmallLabel.isHidden=false


            }
        }else{
            if indexPath.row==0{
                FeesCollectionCell.LeftLabel.text="ATM Deposit"
                FeesCollectionCell.RightLabel.text="Free"
                FeesCollectionCell.SmallLabel.text="Deposit money into your account through any Banque Du Caire ATM"
                FeesCollectionCell.SmallLabel.isHidden=false


                
            }else if indexPath.row==1{
                FeesCollectionCell.LeftLabel.text="Bank transfer"
                FeesCollectionCell.RightLabel.text="Free"
                FeesCollectionCell.SmallLabel.text="Transfer money to your account from any local bank"
                FeesCollectionCell.SmallLabel.isHidden=false


            }else if indexPath.row==2{
                FeesCollectionCell.LeftLabel.text="Fawry"
                FeesCollectionCell.RightLabel.text="-1%"
                FeesCollectionCell.SmallLabel.text="Fawry administrative fees"
                FeesCollectionCell.SmallLabel.isHidden=false


            }else if indexPath.row==3{
                FeesCollectionCell.SmallLabel.isHidden=true
                FeesCollectionCell.LeftLabel.text="Request from Telda users"
                FeesCollectionCell.RightLabel.text="Free"
            }else{
                FeesCollectionCell.LeftLabel.text="InstaPay"
                FeesCollectionCell.RightLabel.text="Free"
                FeesCollectionCell.SmallLabel.text="Transfer money to your account through InstaPay"
                FeesCollectionCell.SmallLabel.isHidden=false


            }
        }
       
        return FeesCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
            
            DispatchQueue.main.async {
                if indexPath.section==0{
                    headerView.SectionLabel.text="Card"
                }else if indexPath.section==1{
                    headerView.SectionLabel.text="Send"
                }else if indexPath.section==2{
                    headerView.SectionLabel.text="Spend"
                }else{
                    headerView.SectionLabel.text="Add money"
                    
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension FeesVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeesVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=5
        flowLayout.sectionInset=UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/5+25)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 20) // Adjust the height as needed
    }
}

//MARK: - usefull functions
extension FeesVC{
    @objc func refreshData() {
        // Perform your refresh operation here
        FeesCollectionView.reloadData()
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
  
}
