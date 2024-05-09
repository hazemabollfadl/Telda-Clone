//
//  WhatIsYourGoalVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 12/04/2024.
//

import UIKit

class WhatIsYourGoalVC: UIViewController {
    
    @IBOutlet var WhatsYourGoalCollectionView: UICollectionView!
    
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WhatsYourGoalCollectionView.delegate=self
        WhatsYourGoalCollectionView.dataSource=self
        
        let nib = UINib(nibName: "SpacesPlanupCell", bundle: .main)
        WhatsYourGoalCollectionView.register(nib, forCellWithReuseIdentifier: "SpacesPlanupCell")
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
        
        WhatsYourGoalCollectionView.reloadData()
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
}

//MARK: - UICollectionViewDataSource
extension WhatIsYourGoalVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let SpacesPlanupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpacesPlanupCell", for: indexPath) as! SpacesPlanupCell
        return SpacesPlanupCell
    }
}

//MARK: - UICollectionViewDelegate
extension WhatIsYourGoalVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoalToPlanAndSave", sender: self)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension WhatIsYourGoalVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=15
                flowLayout.sectionInset=UIEdgeInsets(top: 20, left: 0, bottom: 15, right: 0)
        
        return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/3+25)
        
    }
}
