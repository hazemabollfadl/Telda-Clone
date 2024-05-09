//  HomePageVC.swift
//  Telda
//  Created by Hazem Abou El Fadl on 05/04/2024.

import UIKit

class SharedData {
    static let shared = SharedData() // Singleton instance
    
    var select: Bool=false
    let overlayView = UIView(frame: UIScreen.main.bounds)
    
    private init() {} // Private initializer to prevent external instantiation
}

class HomePageVC: UIViewController{
    
    
    let refreshControl = UIRefreshControl()
    
    
    
    @IBOutlet var BigView: UIView!
    
    @IBOutlet var transactionTableView: UITableView!
    @IBOutlet var priceLabel: BlurText!
    
    @IBOutlet var currentBalanceButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            if SharedData.shared.select==true{
                self.priceLabel.unblur()
                self.currentBalanceButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                self.priceLabel.blur(5)
                self.currentBalanceButton.tintColor = .red
            }else{
                self.currentBalanceButton.setImage(UIImage(systemName: "eye"), for: .normal)
                self.priceLabel.unblur()
                self.currentBalanceButton.tintColor = UIColor(named: "AccentColor")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        transactionTableView.delegate=self
        transactionTableView.dataSource=self
        
        
        let nib=UINib(nibName: "AddSendInsightCell", bundle: .main)
        transactionTableView.register(nib, forCellReuseIdentifier: "AddSendInsightCell")
        
        let nib1=UINib(nibName: "HomePageCell", bundle: .main)
        transactionTableView.register(nib1, forCellReuseIdentifier: "HomePageCell")
        
        //transactionTableView.estimatedRowHeight = 68.0
        transactionTableView.rowHeight = UITableView.automaticDimension
        
        transactionTableView.showsVerticalScrollIndicator=false
        
        transactionTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
    }
    
    
    @IBAction func currentBalancePressed(_ sender: UIButton) {
        
        if SharedData.shared.select==false{
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            priceLabel.blur(5)
            sender.tintColor = .red
            
            SharedData.shared.select=true
        }else{
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
            priceLabel.unblur()
            sender.tintColor = UIColor(named: "AccentColor")
            
            SharedData.shared.select=false
        }
    }
    
    
    
}


//================================================================================================================================
//MARK: - UITableViewDataSource
extension HomePageVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "HomePageCell") as! HomePageCell
        
        let customCell=tableView.dequeueReusableCell(withIdentifier: "AddSendInsightCell") as! AddSendInsightCell
        
        cell.selectionStyle = .none
        
        customCell.delegate=self
        customCell.selectionStyle = .none
        
        if indexPath.row==0{
            return customCell
        }else{
            return cell
        }
    }
    
}


//================================================================================================================================
//MARK: - UITableViewDelegate
extension HomePageVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "TransactionDetailsNavBar") as! UINavigationController
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
    
    
}


//================================================================================================================================
//MARK: - CustomTableViewCellDelegate
extension HomePageVC:CustomTableViewCellDelegate{
    func addMoneyButtonPressed() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
            let vc  = storyboard.instantiateViewController(withIdentifier: "AddMoneyVC") as! AddMoneyVC
            
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium()]
            }
            
            SharedData.shared.overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
            self.view.addSubview(SharedData.shared.overlayView)
            
            self.present(vc, animated: true)
        }
    }
    
    func sendMoneyButtonPressed() {
        DispatchQueue.main.async {
            self.navigateToTab(index: 2)
        }
    }
    
    func insightButtonPressed() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
//            let vc  = storyboard.instantiateViewController(withIdentifier: "InsightVC") as! InsightVC
//            vc.modalPresentationStyle = .popover
//            self.present(vc, animated: true)
            let navController = storyboard.instantiateViewController(withIdentifier: "InsightNavController") as! UINavigationController
            navController.modalPresentationStyle = .popover
            self.present(navController, animated: true)
        }
    }
}


//================================================================================================================================
//MARK: - usefull functions
extension HomePageVC{
    
    @objc func refreshData() {
        // Perform your refresh operation here
        transactionTableView.reloadData()
        // After refreshing is done, end refreshing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }
    
    func navigateToTab(index: Int) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = index
        }
    }
    
}
