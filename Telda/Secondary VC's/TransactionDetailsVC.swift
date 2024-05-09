//
//  TransactionDetailsVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 10/04/2024.
//

import UIKit

class TransactionDetailsVC: UIViewController {
    
    @IBOutlet var TransactionDetailsCollectionView: UICollectionView!
    static var mySwitch:UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TransactionDetailsCollectionView.delegate=self
        TransactionDetailsCollectionView.dataSource=self
        
        let nib = UINib(nibName: "TransactionDetailsTopCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib, forCellWithReuseIdentifier: "TransactionDetailsTopCell")
        
         let nib1 = UINib(nibName: "TransactionDetailsButtonCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib1, forCellWithReuseIdentifier: "TransactionDetailsButtonCell")
        
        let nib2 = UINib(nibName: "TransactionDetailsStatusCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib2, forCellWithReuseIdentifier: "TransactionDetailsStatusCell") 
        
        let nib3 = UINib(nibName: "CategorieAndExecludeCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib3, forCellWithReuseIdentifier: "CategorieAndExecludeCell")
         
        let nib4 = UINib(nibName: "PaymentToAndPhoneNumberCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib4, forCellWithReuseIdentifier: "PaymentToAndPhoneNumberCell")
          
        let nib5 = UINib(nibName: "TransactionDetailsReportIssueCell", bundle: .main)
        TransactionDetailsCollectionView.register(nib5, forCellWithReuseIdentifier: "TransactionDetailsReportIssueCell")
        
    }
    
    
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

//MARK: - UICollectionViewDataSource
extension TransactionDetailsVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let TransactionDetailsTopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionDetailsTopCell", for: indexPath) as! TransactionDetailsTopCell
        
        let TransactionDetailsButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionDetailsButtonCell", for: indexPath) as! TransactionDetailsButtonCell
        TransactionDetailsButtonCell.delegate=self
        
        let TransactionDetailsStatusCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionDetailsStatusCell", for: indexPath) as! TransactionDetailsStatusCell  
        
        let CategorieAndExecludeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieAndExecludeCell", for: indexPath) as! CategorieAndExecludeCell
        CategorieAndExecludeCell.delegate=self
          
        let PaymentToAndPhoneNumberCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentToAndPhoneNumberCell", for: indexPath) as! PaymentToAndPhoneNumberCell
           
        let TransactionDetailsReportIssueCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionDetailsReportIssueCell", for: indexPath) as! TransactionDetailsReportIssueCell
        
        if indexPath.row==0{
            return TransactionDetailsTopCell
        }else if indexPath.row==1{
            return TransactionDetailsButtonCell
        }else if indexPath.row==2{
            return TransactionDetailsStatusCell
        }else if indexPath.row==3{
            return CategorieAndExecludeCell
        }else if indexPath.row==4{
            return PaymentToAndPhoneNumberCell
        }else{
            return TransactionDetailsReportIssueCell
        }
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension TransactionDetailsVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row==5{
            let storyboard = UIStoryboard(name: "Third", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ChatWithUsVC") as! ChatWithUsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            print(indexPath)
        }
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension TransactionDetailsVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=15
//        flowLayout.sectionInset=UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        if indexPath.row==0{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/3+20)
        }else if indexPath.row==1 || indexPath.row==2{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/6-10)
        }else if indexPath.row==3 || indexPath.row==4{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/4+15)
        }else{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/6-10)
        }
        
    }
}

//MARK: - SplitAndPayLaterButtonsPressed protcol
extension TransactionDetailsVC:SplitAndPayLaterButtonsPressed{
    func splitWithOtherButtonPressed() {
        performSegue(withIdentifier: "TransactionDetailsToSplitWithOthers", sender: self)
    }
    
    func payLaterButtonPressed() {
        let storyboard = UIStoryboard(name: "Third", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "PayLaterVC") as! PayLaterVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
}

//MARK: - categoriesButtonPressed protocol
extension TransactionDetailsVC:sendCellItems{
    func sendSwitch(_ mySwitch: UISwitch) {
        if mySwitch.isOn{
            let alert = UIAlertController(title: "", message: "Transaction execluded from insight", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func categoriesButtonPressed() {
        performSegue(withIdentifier: "TransactionDetailsToServices", sender: self)
    }
    
    
}
