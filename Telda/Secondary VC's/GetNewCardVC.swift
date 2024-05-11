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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetNewCardCollectionView.dataSource=self
        GetNewCardCollectionView.delegate=self
        
        let nib=UINib(nibName: "GetNewCardCardsCell", bundle: .main)
        GetNewCardCollectionView.register(nib, forCellWithReuseIdentifier: "GetNewCardCardsCell")
        
        let nib1=UINib(nibName: "CardLabelCell", bundle: .main)
        GetNewCardCollectionView.register(nib1, forCellWithReuseIdentifier: "CardLabelCell")
        
    }
    
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
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
            CardLabelCell.CellButton.tintColor = .label
            CardLabelCell.CellButton.setTitle("Get Standard", for: .normal)

            CardLabelCell.BigLabel.text="Standard"
            CardLabelCell.SmallLabel.text="A timeless black card with a matte finish."
            CardLabelCell.SmallLabel2.isHidden=true
            
        }else if indexPath.section==1{
            
            GetNewCardCardsCell.CardImage.tintColor = .myColor3
            CardLabelCell.CellButton.tintColor = .myColor3
            CardLabelCell.CellButton.setTitle("Get Plus", for: .normal)

            CardLabelCell.BigLabel.text="Plus ~ Sunny"
            CardLabelCell.SmallLabel.text="Designed to turn heads, the Sunny Plus"
            CardLabelCell.SmallLabel2.text="card is like nothing you've seen before."
            CardLabelCell.SmallLabel2.isHidden=false
        }else{
            GetNewCardCardsCell.CardImage.tintColor = .myColor1
            CardLabelCell.CellButton.tintColor = .myColor1
            CardLabelCell.CellButton.setTitle("Get Plus", for: .normal)


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
        let storyboard = UIStoryboard(name: "Third", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "ChooseYourPlanVC") as! ChooseYourPlanVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    
    
}
