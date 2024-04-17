//
//  SpacesVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

class SpacesVC: UIViewController {
    
    @IBOutlet var SpacesCollectionView: UICollectionView!
    
    @IBOutlet var currentBalanceButton: UIButton!
    @IBOutlet var PriceLabel: BlurText!
    
    let refreshControl = UIRefreshControl()

    
    override func viewWillAppear(_ animated: Bool) {
        
        if SharedData.shared.select==true{
            PriceLabel.unblur()
            currentBalanceButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            PriceLabel.blur(5)
            currentBalanceButton.tintColor = .red
        }else{
            currentBalanceButton.setImage(UIImage(systemName: "eye"), for: .normal)
            PriceLabel.unblur()
            currentBalanceButton.tintColor = UIColor(named: "AccentColor")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpacesCollectionView.dataSource=self
        SpacesCollectionView.delegate=self
        
        let nib=UINib(nibName: "SpacesCollectionCell", bundle: .main)
        SpacesCollectionView.register(nib, forCellWithReuseIdentifier: "SpacesCollectionCell")
        
        let nib1=UINib(nibName: "SpaceAddCollectionCell", bundle: .main)
        SpacesCollectionView.register(nib1, forCellWithReuseIdentifier: "SpaceAddCollectionCell")
        
        
        SpacesCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    @objc func refreshData() {
        // Perform your refresh operation here
        
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func currentBalanceButtonPressed(_ sender: UIButton) {
        
        if SharedData.shared.select==false{
            currentBalanceButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            PriceLabel.blur(5)
            currentBalanceButton.tintColor = .red
            
            SharedData.shared.select=true
        }else{
            currentBalanceButton.setImage(UIImage(systemName: "eye"), for: .normal)
            PriceLabel.unblur()
            currentBalanceButton.tintColor = UIColor(named: "AccentColor")
            
            SharedData.shared.select=false
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SpacesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=SpacesCollectionView.dequeueReusableCell(withReuseIdentifier: "SpacesCollectionCell", for: indexPath) as! SpacesCollectionCell
        
        
        let addCell=SpacesCollectionView.dequeueReusableCell(withReuseIdentifier: "SpaceAddCollectionCell", for: indexPath) as! SpaceAddCollectionCell
        
        addCell.delegate=self
        
        if indexPath.row == (collectionView.numberOfItems(inSection: 0))-1{
            return addCell
        } else{
            return cell
        }
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension SpacesVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == (collectionView.numberOfItems(inSection: 0))-1{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "WhatIsYourGoalVC") as! WhatIsYourGoalVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }else{
            print("Selcted item an index: \(indexPath)")
        }
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension SpacesVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=16
        flowLayout.minimumInteritemSpacing=8
        
        
        return CGSize(width: (collectionView.bounds.width/2)-8, height: (collectionView.bounds.width/2)-8)
    }
    
}

//MARK: - CustomCollectionCellDelegate
extension SpacesVC:CustomCollectionCellDelegate{
    func addButtonPressed() {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "WhatIsYourGoalVC") as! WhatIsYourGoalVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    
}
