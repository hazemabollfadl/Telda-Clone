//
//  GetNewCardVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 16/04/2024.
//

import UIKit

class GetNewCardVC: UIViewController {
    
    @IBOutlet var PageIndicator: UIPageControl!
    @IBOutlet var GetNewCardCollectionView: UICollectionView!
    
    var floatingButton: UIButton!
    
    static var NewCardCurrentPage:Int?
    
    static var NonAutomatedRouteDismiss=false
    
    override func viewIsAppearing(_ animated: Bool) {
        
        UpgradeCardVC.isPressedInUpgrade=false
        
        if GetNewCardVC.NonAutomatedRouteDismiss==true{
            performSegue(withIdentifier: "GetNewCardToConfirmName", sender: self)
            GetNewCardVC.NonAutomatedRouteDismiss=false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetNewCardCollectionView.dataSource=self
        GetNewCardCollectionView.delegate=self
        
        let nib=UINib(nibName: "GetNewCardCardsCell", bundle: .main)
        GetNewCardCollectionView.register(nib, forCellWithReuseIdentifier: "GetNewCardCardsCell")
        
        let nib1=UINib(nibName: "CardLabelCell", bundle: .main)
        GetNewCardCollectionView.register(nib1, forCellWithReuseIdentifier: "CardLabelCell")
        
        makingAButton(ButtonLabel: "Get Standard", BackgroundColor: .black, TitleColor: .systemBackground)
        
    }
    
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if currentPage==0{
            makingAButton(ButtonLabel: "Get Standard", BackgroundColor: .black, TitleColor: .systemBackground)
        }else if currentPage==1{
            makingAButton(ButtonLabel: "Get Plus", BackgroundColor: .myColor1, TitleColor: .black)
        }else{
            makingAButton(ButtonLabel: "Get Premium", BackgroundColor: .myColor3, TitleColor: .black)
        }
        PageIndicator.currentPage = currentPage
    }
    
}

//MARK: - UICollectionViewDataSource and UICollectionViewDelegate
extension GetNewCardVC:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        PageIndicator.numberOfPages=3
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let GetNewCardCardsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GetNewCardCardsCell", for: indexPath) as! GetNewCardCardsCell
        
        let CardLabelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardLabelCell", for: indexPath) as! CardLabelCell
        CardLabelCell.delegate=self
        
        if indexPath.section==0{
            
            GetNewCardCardsCell.CardImage.tintColor = .label
            
            CardLabelCell.BigLabel.text="Standard"
            CardLabelCell.SmallLabel.text="A timeless black card with a matte finish."
            CardLabelCell.SmallLabel2.isHidden=true
            
        }else if indexPath.section==2{
            
            GetNewCardCardsCell.CardImage.tintColor = .myColor3
            
            CardLabelCell.BigLabel.text="Premium ~ Sunny"
            CardLabelCell.SmallLabel.text="Designed to turn heads, the Sunny Plus"
            CardLabelCell.SmallLabel2.text="card is like nothing you've seen before."
            CardLabelCell.SmallLabel2.isHidden=false
        }else{
            GetNewCardCardsCell.CardImage.tintColor = .myColor1
            
            CardLabelCell.BigLabel.text="Plus ~ Grass"
            CardLabelCell.SmallLabel.text="Customized Telda card with bold color"
            
            CardLabelCell.SmallLabel2.text="choice, Make it loud, make it yours!"
            
            CardLabelCell.SmallLabel2.isHidden=false
            
        }
        
        if indexPath.row==0{
            return GetNewCardCardsCell
        }else{
            return CardLabelCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension GetNewCardVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing=0
        flowLayout.sectionInset=UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        if indexPath.row==0{
            return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width + (collectionView.bounds.width/5-8) )
        }else{
            return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.width/2)
        }
        
    }
}

//MARK: - getStartedButtonPressed protocol
extension GetNewCardVC:getStartedButtonPressed{
    func getStartedButtonPressed() {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    
}

//MARK: - usefull functions
extension GetNewCardVC{
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
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            //            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingButton.widthAnchor.constraint(equalToConstant: GetNewCardCollectionView.bounds.width-32),
            floatingButton.heightAnchor.constraint(equalToConstant: GetNewCardCollectionView.bounds.width/6-16)
        ])
    }
    @objc func buttonTapped() {
        if PageIndicator.currentPage != 0{
            
            if CardVC.AutomatedNavigation==true{
                performSegue(withIdentifier: "GetNewCardToConfirmName", sender: self)
                
            //Non automated Nav response
            }else{
                
              GetNewCardVC.NewCardCurrentPage=PageIndicator.currentPage
                let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "UpgradeCardVC") as! UpgradeCardVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        else{
            performSegue(withIdentifier: "GetNewCardToConfirmName", sender: self)
        }
    }
    
}
