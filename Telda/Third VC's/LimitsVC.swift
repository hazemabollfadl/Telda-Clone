//
//  LimitsVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class LimitsVC: UIViewController {
    
    @IBOutlet var LimitsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LimitsCollectionView.delegate=self
        LimitsCollectionView.dataSource=self
        
        let nib = UINib(nibName: "LimitsCollectionCell", bundle: .main)
        
        LimitsCollectionView.register(nib, forCellWithReuseIdentifier: "LimitsCollectionCell")
        
    }
    
}
//MARK: - UICollectionViewDataSource
extension LimitsVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let LimitsCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LimitsCollectionCell", for: indexPath) as! LimitsCollectionCell
        
        if indexPath.row==0{
            LimitsCollectionCell.HeadLabel.text="Daily Transactions Limit"
            LimitsCollectionCell.BigLabel.text="EGP 60,000"
            LimitsCollectionCell.SmallLabel1.text="Left to spend, send and withdraw"
            LimitsCollectionCell.SmallLabel2.text="Daily spending limits is EGP 60,000"
            LimitsCollectionCell.ProgressBar.progress = 0.7
            
        }else if indexPath.row==1{
            LimitsCollectionCell.HeadLabel.text="Daily cash withdrawal limit"
            LimitsCollectionCell.BigLabel.text="EGP 30,000"
            LimitsCollectionCell.SmallLabel1.text="Left to withdraw"
            LimitsCollectionCell.SmallLabel2.text="Daily cash withdrawal limit is EGP 30,000"
            LimitsCollectionCell.ProgressBar.progress = 0.9
        }else if indexPath.row==2{
            LimitsCollectionCell.HeadLabel.text="Monthly Transactions Limit"
            LimitsCollectionCell.BigLabel.text="EGP 200,000"
            LimitsCollectionCell.SmallLabel1.text="Left to spend, send and withdraw"
            LimitsCollectionCell.SmallLabel2.text="Monthly Transactions Limit is EGP 200,000"
            LimitsCollectionCell.ProgressBar.progress = 0.5
        }else{
            LimitsCollectionCell.HeadLabel.text="Maximum Balance Limit"
            LimitsCollectionCell.BigLabel.text="EGP 999,999"
            LimitsCollectionCell.SmallLabel1.text="Balance limit left"
            LimitsCollectionCell.SmallLabel2.text="Maximum Balance Limit is EGP 1,000,000"
            LimitsCollectionCell.ProgressBar.progress = 0.8
        }
        
        return LimitsCollectionCell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension LimitsVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension LimitsVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=30
        flowLayout.sectionInset=UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/2)
        
    }
}
