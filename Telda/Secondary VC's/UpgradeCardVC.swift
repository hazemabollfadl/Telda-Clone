//
//  UpgradeCardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit
import AudioToolbox

class UpgradeCardVC: UIViewController {
    
    @IBOutlet var UpgradeCardColletionView: UICollectionView!
    
    @IBOutlet var SegmentedControl: UISegmentedControl!
    
    var cancelPressed:Bool=false
    
    var floatingButton: UIButton!
    
    //To Detect when the button is pressed to notify CardVC when it loads to navigate to GetNewCardVC
    static var isPressedInUpgrade:Bool=false
    
    var plusAmount="29"
    var premuimAmount="49"
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isBeingDismissed {
            if cancelPressed==false{
                GetNewCardVC.NonAutomatedRouteDismiss=true
            }else{
                GetNewCardVC.NonAutomatedRouteDismiss=false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpgradeCardColletionView.delegate=self
        UpgradeCardColletionView.dataSource=self
        
        if GetNewCardVC.NewCardCurrentPage == 1 || ManagePlanVC.CellPressed==0{
            SegmentedControl.selectedSegmentIndex=0
            
            makingAButton(ButtonLabel: "Get Plus for EGP \(plusAmount)/month", BackgroundColor: .myColor1, TitleColor: .black)
        }else{
            SegmentedControl.selectedSegmentIndex=1
            
            makingAButton(ButtonLabel: "Get Premium for EGP \(premuimAmount)/month", BackgroundColor: .myColor3, TitleColor: .black)

        }
        
        
        let nib = UINib(nibName: "UpgradeCardCollectionViewCell", bundle: .main)
        UpgradeCardColletionView.register(nib, forCellWithReuseIdentifier: "UpgradeCardCollectionViewCell")
          
        let nib1 = UINib(nibName: "UpgradeCardPlusDetails", bundle: .main)
        UpgradeCardColletionView.register(nib1, forCellWithReuseIdentifier: "UpgradeCardPlusDetails")
          
        let nib2 = UINib(nibName: "UpgradeCardPlusDetails2", bundle: .main)
        UpgradeCardColletionView.register(nib2, forCellWithReuseIdentifier: "UpgradeCardPlusDetails2")
        
        SegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
                
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
        cancelPressed=true
        
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex==0{
            makingAButton(ButtonLabel: "Get Plus for EGP \(plusAmount)/month", BackgroundColor: .myColor1, TitleColor: .black)
        }else{
            makingAButton(ButtonLabel: "Get Premium for EGP \(premuimAmount)/month", BackgroundColor: .myColor3, TitleColor: .black)
        }
        UpgradeCardColletionView.reloadData()
        
    }
}

//MARK: - UICollectionViewDataSource
extension UpgradeCardVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let UpgradeCardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeCardCollectionViewCell", for: indexPath) as! UpgradeCardCollectionViewCell
        
        let UpgradeCardPlusDetails = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeCardPlusDetails", for: indexPath) as! UpgradeCardPlusDetails
          
        let UpgradeCardPlusDetails2 = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeCardPlusDetails2", for: indexPath) as! UpgradeCardPlusDetails2
        
        if SegmentedControl.selectedSegmentIndex==0{
            if indexPath.row==0{
                UpgradeCardCollectionViewCell.BigLabel.text="Plus"
                UpgradeCardCollectionViewCell.SmallLabel.text="EGP \(plusAmount) / month"
                
                UpgradeCardCollectionViewCell.BigLabel.textColor = .black
                UpgradeCardCollectionViewCell.SmallLabel.textColor = .black
                UpgradeCardCollectionViewCell.SmallView.backgroundColor = .myColor1
                UpgradeCardCollectionViewCell.CellImage.tintColor = .black

                
                return UpgradeCardCollectionViewCell
                
            }else if indexPath.row==1{
                
                UpgradeCardPlusDetails.CellHeader.text="ATM Withdrawal"
                UpgradeCardPlusDetails.BigLabel.text="Free withdrawals"
                UpgradeCardPlusDetails.SmallLabel.text="Withdraw cash from any Banque Du "
                UpgradeCardPlusDetails.SmallLabel1.text="Caire ATM for free. Fees apply on other"
                UpgradeCardPlusDetails.SmallLabel2.text="banks ATM."
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "archivebox.fill")
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor1
                
                return UpgradeCardPlusDetails
                
            }else if indexPath.row==2{
                UpgradeCardPlusDetails.CellHeader.text="Points"
                UpgradeCardPlusDetails.BigLabel.text="Earn 50% more points"
                UpgradeCardPlusDetails.SmallLabel.text="Make the most out of your spendings &"
                UpgradeCardPlusDetails.SmallLabel1.text="earn points faster."
                UpgradeCardPlusDetails.SmallLabel2.isHidden=true
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "target")
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor1

                
                return UpgradeCardPlusDetails
            }else if indexPath.row==3{
                UpgradeCardPlusDetails.CellHeader.text="Spaces"
                UpgradeCardPlusDetails.BigLabel.text="Get up to 3 Spaces"
                UpgradeCardPlusDetails.SmallLabel.text="Expand your account with 3 more"
                UpgradeCardPlusDetails.SmallLabel1.text="spaces in addition to your main balance"
                UpgradeCardPlusDetails.SmallLabel2.text="account and save-up."
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "window.vertical.closed")
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor1

                return UpgradeCardPlusDetails
            }else if indexPath.row==4{
                UpgradeCardPlusDetails2.CellHeader.text="App Customization"
                UpgradeCardPlusDetails2.BigLabel1.text="Plus Badge"
                UpgradeCardPlusDetails2.SmallLabel1.text="Standout with the Plus"
                UpgradeCardPlusDetails2.SmallLabel11.text="username badge."
                UpgradeCardPlusDetails2.CellImage1.image=UIImage(systemName: "star.circle.fill")
                
                UpgradeCardPlusDetails2.BigLabel2.text="Plus App Icon"
                UpgradeCardPlusDetails2.SmallLabel2.text="Customize your Telda app icon with"
                UpgradeCardPlusDetails2.SmallLabel21.text="the unique Plus icon."
                UpgradeCardPlusDetails2.CellImage2.image=UIImage(systemName: "tree.circle.fill")
                UpgradeCardPlusDetails2.CellImage1.tintColor = .myColor1
                UpgradeCardPlusDetails2.CellImage2.tintColor = .myColor1

                
                return UpgradeCardPlusDetails2
            }else{
                UpgradeCardPlusDetails.CellHeader.text="Customer support"
                UpgradeCardPlusDetails.BigLabel.text="Dedicated support"
                UpgradeCardPlusDetails.SmallLabel.text="Get priority customer support, available"
                UpgradeCardPlusDetails.SmallLabel1.text="for plus members for a seamless and"
                UpgradeCardPlusDetails.SmallLabel2.text="efficient support experience."
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "bubble.circle.fill")
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor1

                
                return UpgradeCardPlusDetails
            }
        }else{
            if indexPath.row==0{
                UpgradeCardCollectionViewCell.BigLabel.text="Premium"
                UpgradeCardCollectionViewCell.SmallLabel.text="EGP \(premuimAmount) / month"
                
                UpgradeCardCollectionViewCell.BigLabel.textColor = .black
                UpgradeCardCollectionViewCell.SmallLabel.textColor = .black
                UpgradeCardCollectionViewCell.SmallView.backgroundColor = .myColor3
                UpgradeCardCollectionViewCell.CellImage.tintColor = .black
                
                return UpgradeCardCollectionViewCell
                
            }else if indexPath.row==1{
                UpgradeCardPlusDetails2.CellHeader.text="ATM Withdrawal"
                UpgradeCardPlusDetails2.BigLabel1.text="BDC free withdrawals"
                UpgradeCardPlusDetails2.SmallLabel1.text="Withdraw cash from any Banque Du"
                UpgradeCardPlusDetails2.SmallLabel11.text="Caire ATM for free."
                UpgradeCardPlusDetails2.CellImage1.image=UIImage(systemName: "archivebox.fill")
                
                UpgradeCardPlusDetails2.BigLabel2.text="Other banks free withdrawls"
                UpgradeCardPlusDetails2.SmallLabel2.text="Free withdrawals from ther banks'"
                UpgradeCardPlusDetails2.SmallLabel21.text="ATM's 3 times per month."
                UpgradeCardPlusDetails2.CellImage2.image=UIImage(systemName: "3.circle.fill")
                
                UpgradeCardPlusDetails2.CellImage1.tintColor = .myColor3
                UpgradeCardPlusDetails2.CellImage2.tintColor = .myColor3
               
                return UpgradeCardPlusDetails2

                
            }else if indexPath.row==2{
                
                UpgradeCardPlusDetails2.CellHeader.text="Points"
                UpgradeCardPlusDetails2.BigLabel1.text="Earn 2x more points"
                UpgradeCardPlusDetails2.SmallLabel1.text="Make the most out of your spendings &"
                UpgradeCardPlusDetails2.SmallLabel11.text="earn points faster."
                UpgradeCardPlusDetails2.CellImage1.image=UIImage(systemName: "target")
                
                UpgradeCardPlusDetails2.BigLabel2.text="Redeem cash"
                UpgradeCardPlusDetails2.SmallLabel2.text="Redeem your points with cash directly"
                UpgradeCardPlusDetails2.SmallLabel21.text="in your account."
                UpgradeCardPlusDetails2.CellImage2.image=UIImage(systemName: "dollarsign.circle.fill")
                
                UpgradeCardPlusDetails2.CellImage1.tintColor = .myColor3
                UpgradeCardPlusDetails2.CellImage2.tintColor = .myColor3
                
                return UpgradeCardPlusDetails2
                
            }else if indexPath.row==3{
                UpgradeCardPlusDetails.CellHeader.text="Spaces"
                UpgradeCardPlusDetails.BigLabel.text="Get unlimited Spaces"
                UpgradeCardPlusDetails.SmallLabel.text="Create unlimited Spaces in addition"
                UpgradeCardPlusDetails.SmallLabel1.text="to your main balance and"
                UpgradeCardPlusDetails.SmallLabel2.text="save-up easily."
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "window.vertical.closed")
                
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor3

                return UpgradeCardPlusDetails
                
            }else if indexPath.row==4{
                UpgradeCardPlusDetails2.CellHeader.text="App Customization"
                UpgradeCardPlusDetails2.BigLabel1.text="Premium Badge"
                UpgradeCardPlusDetails2.SmallLabel1.text="Make it loud & show off your"
                UpgradeCardPlusDetails2.SmallLabel11.text="premium username badge."
                UpgradeCardPlusDetails2.CellImage1.image=UIImage(systemName: "star.circle.fill")
                
                UpgradeCardPlusDetails2.BigLabel2.text="Premium App Icon"
                UpgradeCardPlusDetails2.SmallLabel2.text="Make it yours & customize your"
                UpgradeCardPlusDetails2.SmallLabel21.text="Telda app icon."
                UpgradeCardPlusDetails2.CellImage2.image=UIImage(systemName: "tree.circle.fill")
                
                UpgradeCardPlusDetails2.CellImage1.tintColor = .myColor3
                UpgradeCardPlusDetails2.CellImage2.tintColor = .myColor3
                
                return UpgradeCardPlusDetails2
            }else{
                UpgradeCardPlusDetails.CellHeader.text="Customer support"
                UpgradeCardPlusDetails.BigLabel.text="Dedicated support"
                UpgradeCardPlusDetails.SmallLabel.text="Get priority customer support, available"
                UpgradeCardPlusDetails.SmallLabel1.text="for plus members for a seamless and"
                UpgradeCardPlusDetails.SmallLabel2.text="efficient support experience."
                UpgradeCardPlusDetails.CellButton.image=UIImage(systemName: "bubble.circle.fill")
                
                UpgradeCardPlusDetails.CellButton.tintColor = .myColor3

                return UpgradeCardPlusDetails
            }
            
        }
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension UpgradeCardVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension UpgradeCardVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=25
        flowLayout.sectionInset=UIEdgeInsets(top: 10, left: 0, bottom: 70, right: 0)
        
        if SegmentedControl.selectedSegmentIndex==0{
            if indexPath.row==0{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/2)
            }else if indexPath.row==1 ||  indexPath.row==2 || indexPath.row==3 || indexPath.row==5{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/3+30)
            }else{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/2+50)
            }
        }else{
            if indexPath.row==0{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/2)
            }else if indexPath.row==3 ||  indexPath.row==5{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/3+30)
            }else{
                return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/2+50)
            }
        }
    }
}

//MARK: - usefull functions
extension UpgradeCardVC{
    
    func makingAButton(ButtonLabel label:String, BackgroundColor color:UIColor, TitleColor titleColor:UIColor){
        floatingButton = UIButton(type: .system)
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold) ]
        
        let myAttrString = NSAttributedString(string: label, attributes: myAttribute)
        floatingButton.setAttributedTitle(myAttrString, for: .normal)
        
        floatingButton.backgroundColor = color
        
        floatingButton.tintColor = titleColor
        
        floatingButton.layer.cornerRadius=15
        floatingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(floatingButton)
        
        // Add constraints for the floating button
        NSLayoutConstraint.activate([
            floatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            //            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingButton.widthAnchor.constraint(equalToConstant: UpgradeCardColletionView.bounds.width),
            floatingButton.heightAnchor.constraint(equalToConstant: UpgradeCardColletionView.bounds.width/6-16)
        ])
        
//        // Register for keyboard notifications
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func buttonTapped() {
        UpgradeCardVC.isPressedInUpgrade=true
        
        self.dismiss(animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(1521)) { }
            }
    }
}
