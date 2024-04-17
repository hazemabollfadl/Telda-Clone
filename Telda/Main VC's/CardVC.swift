//
//  CardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 05/04/2024.
//

import UIKit

class CardVC: UIViewController {
    
    @IBOutlet var cardTableview: UITableView!
    static var vcSwitch:UISwitch?
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTableview.dataSource=self
        cardTableview.delegate=self
        
        let nib = UINib(nibName: "PremuimCardCell", bundle: .main)
        cardTableview.register(nib, forCellReuseIdentifier: "PremuimCardCell")
        
        let nib1 = UINib(nibName: "LockCard", bundle: .main)
        cardTableview.register(nib1, forCellReuseIdentifier: "LockCard")
        
        let nib2 = UINib(nibName: "ResetPin", bundle: .main)
        cardTableview.register(nib2, forCellReuseIdentifier: "ResetPin")
        
        let nib3 = UINib(nibName: "GetNewCard", bundle: .main)
        cardTableview.register(nib3, forCellReuseIdentifier: "GetNewCard")
        
        
        cardTableview.rowHeight = UITableView.automaticDimension
        
        cardTableview.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        
        cardTableview.showsVerticalScrollIndicator=false
        
    }
    @objc func refreshData() {
        // Perform your refresh operation here
        
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
    
}

//MARK: - UITableViewDataSource
extension CardVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: "PremuimCardCell", for: indexPath) as! PremuimCardCell
        customCell.selectionStyle = .none
        customCell.delegate=self
        
        let lockCell=tableView.dequeueReusableCell(withIdentifier: "LockCard", for: indexPath) as! CardCells
        lockCell.selectionStyle = .none
        lockCell.delegate=self
        
        
        let resetPinCell=tableView.dequeueReusableCell(withIdentifier: "ResetPin", for: indexPath) as! CardCells
        resetPinCell.selectionStyle = .none
        resetPinCell.delegate=self
        
        let getNewCardCell=tableView.dequeueReusableCell(withIdentifier: "GetNewCard", for: indexPath) as! CardCells
        getNewCardCell.selectionStyle = .none
        getNewCardCell.delegate=self
        
        
        if indexPath.row==0{
            return customCell
        }else if indexPath.row==1{
            return lockCell
        }else if indexPath.row==2{
            return resetPinCell
        }else{
            return getNewCardCell
        }
    }
    
}
//MARK: - UITableViewDelegate
extension CardVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row==2{
            
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "ResetPinVC") as! ResetPinVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
            
        }
        
        if indexPath.row==3{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "GetNewCardVC") as! GetNewCardVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
            
        }
    }
}


//MARK: - Protocols
extension CardVC:upgradeButtonPressed, CardCellsButtonPressed{
    
    func upgradeButtonPressed() {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    func ResetPinButtonPressed() {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "ResetPinVC") as! ResetPinVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    func GetNewCardButtonPressed() {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "GetNewCardVC") as! GetNewCardVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    func SendSwitch(_ mySwitch: UISwitch) {
        CardVC.vcSwitch=mySwitch
        if mySwitch.isOn{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "LockCardVC") as! LockCardVC
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
}
