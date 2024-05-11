//
//  SendMoneyVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 13/04/2024.
//

import UIKit

class SendMoneyVC: UIViewController {

    @IBOutlet var MoneyAmountLabel: UILabel!
    
    @IBOutlet var SendMoneyTableView: UITableView!
    @IBOutlet var SendMoneyCollectionView: UICollectionView!
    
    let refreshControl = UIRefreshControl()
    
    var MyTextField = UITextField()
    
    var Selected:Bool=false
    
    var floatingButton: UIButton!
    
    
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
        
        makingAButton()
        floatingButton.isHidden=true

        MoneyAmountLabel.text = "Send " + (TransactionVC.MoneyAmountLabel ?? "EGP 0")

        
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
        
        
        if indexPath.row==0{
            performSegue(withIdentifier: "SendMoneyToScan", sender: self)
            
        }else if indexPath.row==1{
            print(indexPath)
        }else{
            
            let TextFieldTableViewCell = SendMoneyTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! TransactionTextFieldTableViewCell
            
            let SelectedCell = collectionView.cellForItem(at: indexPath) as! TeldaUserCelll
            
            if Selected == false || SelectedCell.CheckMark.isHidden == false{
                if SelectedCell.CheckMark.isHidden == true{
                    view.endEditing(true)
                    SelectedCell.CheckMark.isHidden=false
                    floatingButton.isHidden=false
                    Selected=true
                    TextFieldTableViewCell.TextField.text! =  SelectedCell.UserName.text!
                    
                }else{
                    SelectedCell.CheckMark.isHidden=true
                    floatingButton.isHidden=true
                    Selected=false
                    TextFieldTableViewCell.TextField.text=""
                }
            }else{
                
                let alert = UIAlertController(title: "Error", message: "There is a user already selected", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
            
        
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SendMoneyVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=20
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
    
    func makingAButton(){
        floatingButton = UIButton(type: .system)
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold) ]
        
        let myAttrString = NSAttributedString(string: "Send", attributes: myAttribute)
        floatingButton.setAttributedTitle(myAttrString, for: .normal)
        
        floatingButton.backgroundColor = .link
        floatingButton.tintColor = .white
        floatingButton.layer.cornerRadius=15
        floatingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(floatingButton)
        
        // Add constraints for the floating button
        NSLayoutConstraint.activate([
            floatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingButton.widthAnchor.constraint(equalToConstant: SendMoneyCollectionView.bounds.width-40),
            floatingButton.heightAnchor.constraint(equalToConstant: SendMoneyCollectionView.bounds.width/6-16)
        ])
        
        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func buttonTapped() {
        performSegue(withIdentifier: "SendToConfirm", sender: self)

    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.2
        
        UIView.animate(withDuration: duration) {
            self.floatingButton.frame.origin.y = keyboardFrame.minY - self.floatingButton.frame.height - 10
        }
    }
    
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.2
        
        UIView.animate(withDuration: duration) {
            self.floatingButton.frame.origin.y = self.view.bounds.height - self.floatingButton.frame.height - 30
        }
    }
}
