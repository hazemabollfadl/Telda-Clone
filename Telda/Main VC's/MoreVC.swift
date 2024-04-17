//
//  MoreVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

class MoreVC: UIViewController {
    
    @IBOutlet var moreCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreCollectionView.dataSource=self
        moreCollectionView.delegate=self
        
        let nib=UINib(nibName: "MoreCollectionViewCells", bundle: .main)
        moreCollectionView.register(nib, forCellWithReuseIdentifier: "MoreCollectionViewCells")
        
        let nib1=UINib(nibName: "MoreHeader", bundle: nil)
        moreCollectionView.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MoreHeader")
        
        
    }
    
    
}


//MARK: - UICollectionViewDataSource
extension MoreVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MoreHeader", for: indexPath) as! MoreHeader
            
            if indexPath.section==0{
                headerView.SectionLabel.text="Essentials"
            }else{
                headerView.SectionLabel.text="Lifestyle"
            }
            return headerView
            
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moreCollectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCells", for: indexPath) as! MoreCollectionViewCells
        return cell
    }
    
    
}

//MARK: - UICollectionViewDataSource
extension MoreVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "GiftDetailsVC") as! GiftDetailsVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension MoreVC:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=30
        flowLayout.minimumInteritemSpacing=20
        
        flowLayout.sectionInset=UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        
        return CGSize(width: (collectionView.bounds.width/4)-30, height: (collectionView.bounds.width/4)-10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50) // Adjust the height as needed
    }
    
}
