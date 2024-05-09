//
//  AddMoneyVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 08/04/2024.
//

import UIKit

class AddMoneyVC: UIViewController {
    
    
    @IBOutlet var AddMoneyCollectionView: UICollectionView!
    
    static var isDisimmed:Bool=true
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isBeingDismissed {
            SharedData.shared.overlayView.removeFromSuperview()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddMoneyCollectionView.delegate=self
        AddMoneyCollectionView.dataSource=self
        
        let nib=UINib(nibName: "RecieveTransfersCollectionCell", bundle: .main)
        AddMoneyCollectionView.register(nib, forCellWithReuseIdentifier: "RecieveTransfersCollectionCell")
        
    }
    
}

//MARK: - UITableViewDataSource
extension AddMoneyVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AddMoneyCollectionView.dequeueReusableCell(withReuseIdentifier: "RecieveTransfersCollectionCell", for: indexPath) as! RecieveTransfersCollectionCell
        
        if indexPath.row==0{
            cell.BigLabel.text="Recieve Instapay transfers"
            cell.CellImage.setImage(UIImage(systemName: "iphone.gen2.radiowaves.left.and.right"), for: .normal)
            
        }else if indexPath.row==1{
            cell.BigLabel.text="Recieve bank transfers"
            cell.SmallLabelButton.setTitle("From any local bank", for: .normal)
            
            let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 13.0)! ]
            let myAttrString = NSAttributedString(string: cell.SmallLabelButton.currentTitle!, attributes: myAttribute)
            cell.SmallLabelButton.setAttributedTitle(myAttrString, for: .normal)
            
            cell.SmallLabelButton.tintColor = .label
            cell.SmallLabelButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
            cell.SmallLabelButton.setPreferredSymbolConfiguration(.init(pointSize: 9), forImageIn: .normal)
            cell.SmallLabelButton.alpha=0.5
            
        }else if indexPath.row==2{
            cell.BigLabel.text="Add cash through ATM"
            cell.CellImage.setImage(UIImage(systemName: "archivebox.fill"), for: .normal)
            
            
        }else if indexPath.row==3{
            cell.BigLabel.text="Add cash through Fawry"
            cell.CellImage.setImage(UIImage(systemName: "bolt.horizontal.icloud.fill"), for: .normal)
            
        }else if indexPath.row==4{
            cell.CellImage.setImage(UIImage(systemName: "person.2.fill"), for: .normal)
            cell.BigLabel.text="Request from Telda friends"
        }
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate
extension AddMoneyVC:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row==0{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Third", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "InstapayVC") as! InstapayVC
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
            }
        }else if indexPath.row==1{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Third", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "BankTransfersVC") as! BankTransfersVC
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
            }
            
        }else if indexPath.row==2{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Third", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "CashThroughAtmVC") as! CashThroughAtmVC
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
            }
            
        }else if indexPath.row==3{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Third", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "FawryVC") as! FawryVC
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
            }
            
        }else{
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "TransactionVC") as! TransactionVC
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true)
            }
            
        }
        
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AddMoneyVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.minimumLineSpacing=15
        
        flowLayout.sectionInset=UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        
        return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/4-10)
    }
}

