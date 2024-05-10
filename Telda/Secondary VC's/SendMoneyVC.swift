//
//  SendMoneyVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 13/04/2024.
//

import UIKit

class SendMoneyVC: UIViewController {

    @IBOutlet var SendMoneyTableView: UITableView!
    @IBOutlet var SendMoneyCollectionView: UICollectionView!
    
    let refreshControl = UIRefreshControl()
    
    var MyTextField = UITextField()
    
    override func viewDidAppear(_ animated: Bool) {
        MyTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SendMoneyTableView.dataSource=self
        SendMoneyCollectionView.dataSource=self
        
        SendMoneyTableView.delegate=self
        SendMoneyCollectionView.delegate=self
        
        
        let nib=UINib(nibName: "TransactionTextFieldTableViewCell", bundle: .main)
        SendMoneyTableView.register(nib, forCellReuseIdentifier: "TransactionTextFieldTableViewCell")
        
        let nib1 = UINib(nibName: "ShareQRCodeCell", bundle: .main)
        SendMoneyCollectionView.register(nib1, forCellWithReuseIdentifier: "ShareQRCodeCell")
        
        let nib2 = UINib(nibName: "FriendsOnTeldaCell", bundle: .main)
        SendMoneyCollectionView.register(nib2, forCellWithReuseIdentifier: "FriendsOnTeldaCell")
        
        let nib3 = UINib(nibName: "TeldaUserCelll", bundle: .main)
        SendMoneyCollectionView.register(nib3, forCellWithReuseIdentifier: "TeldaUserCelll")
        
        
        //        RequestMoneyTableView.rowHeight = UITableView.automaticDimension
        
        SendMoneyCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

//MARK: - UITableViewDelegate and UITableViewDataSource
extension SendMoneyVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTextFieldTableViewCell", for: indexPath) as! TransactionTextFieldTableViewCell
        cell.selectionStyle = .none
        
        if indexPath.row==0{
            cell.BigLabel.text="To"
            MyTextField = cell.TextField
        }
        
        if indexPath.row==1{
            cell.BigLabel.text="For"
            cell.TextField.placeholder="Dinner, rent, etc.."
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

//MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension SendMoneyVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ShareQRCodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareQRCodeCell", for: indexPath) as! ShareQRCodeCell
        
        let FriendsOnTeldaCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsOnTeldaCell", for: indexPath) as! FriendsOnTeldaCell
        
        let TeldaUserCelll = collectionView.dequeueReusableCell(withReuseIdentifier: "TeldaUserCelll", for: indexPath) as! TeldaUserCelll
        
        if indexPath.row==0{
            return ShareQRCodeCell
        }else if indexPath.row==1{
            return FriendsOnTeldaCell
        }else{
            return TeldaUserCelll
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SendMoneyVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=10
        flowLayout.sectionInset=UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        if indexPath.row==0{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/5-20)
        }else if indexPath.row==1{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/8-20)
        }else{
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/6)
        }
    }
}

//MARK: - Usefull functions
extension SendMoneyVC{
    @objc func refreshData() {
        // Perform your refresh operation here
        SendMoneyCollectionView.reloadData()
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
    
}
