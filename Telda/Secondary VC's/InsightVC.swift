//
//  InsightVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 08/04/2024.
//

import UIKit

class InsightVC: UIViewController,UIPageViewControllerDelegate {
    
    //    @available(iOS 17.0, *)
    //    func pageControlProgressVisibilityDidChange(_ progress: UIPageControlProgress) {
    //        print("hi")
    //    }
    
    
    var SelectedSegmentIndex:Int=0
    
    @IBOutlet var BigViewHeightContraint: NSLayoutConstraint!
    
    @IBOutlet var SmallViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var Dots: UIPageControl!
    
    @IBOutlet var InsightCollectionView: UICollectionView!
    
    @IBOutlet var CategoriesCollectionView: UICollectionView!
    
    @IBOutlet var SegmentedControl: UISegmentedControl!
    
    @IBOutlet var SmallView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InsightCollectionView.delegate=self
        InsightCollectionView.dataSource=self
        
        CategoriesCollectionView.delegate=self
        CategoriesCollectionView.dataSource=self
        
        
        
        let nib=UINib(nibName: "InsightDataCell", bundle:.main)
        InsightCollectionView.register(nib, forCellWithReuseIdentifier: "InsightDataCell")
        
        let nib1=UINib(nibName: "InsightSetBudgetCell", bundle:.main)
        InsightCollectionView.register(nib1, forCellWithReuseIdentifier: "InsightSetBudgetCell")
        
        let nib2=UINib(nibName: "CategoriesCollectionCell", bundle: .main)
        CategoriesCollectionView.register(nib2, forCellWithReuseIdentifier: "CategoriesCollectionCell")
        
        let nib3=UINib(nibName: "SecondCategoriesCollectionCell", bundle: .main)
        CategoriesCollectionView.register(nib3, forCellWithReuseIdentifier: "SecondCategoriesCollectionCell")
        
        SegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        SmallView.layer.cornerRadius=15
        
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func manageCategoriesButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "InsightToManageCategories", sender: self)
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        SelectedSegmentIndex=SegmentedControl.selectedSegmentIndex
        
        CategoriesCollectionView.reloadData()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        Dots.currentPage = currentPage
        
        if Dots.currentPage != 0 {
            BigViewHeightContraint.constant=960
            SmallViewHeightConstraint.constant = 480
        }else{
            BigViewHeightContraint.constant=730
            SmallViewHeightConstraint.constant = 140
        }
        
        InsightCollectionView.reloadData()
        CategoriesCollectionView.reloadData()
    }
    
}



//MARK: - UICollectionViewDataSource
extension InsightVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView==InsightCollectionView{
            let noOfPages:Int=4
            Dots.numberOfPages=noOfPages
            return noOfPages
        }else{
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView==InsightCollectionView{
            return 2
        }else{
            if Dots.currentPage == 0{
                return 1
            }else{
                return 5
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView==InsightCollectionView{
            let insightDataCell=InsightCollectionView.dequeueReusableCell(withReuseIdentifier: "InsightDataCell", for: indexPath) as! InsightDataCell
            
            let insightSetBudgetCell=InsightCollectionView.dequeueReusableCell(withReuseIdentifier: "InsightSetBudgetCell", for: indexPath) as! InsightSetBudgetCell
            
            if indexPath.row==0{
                if Dots.currentPage==0{
                    insightDataCell.CellSmallLabel.text="Expenses in April"
                    insightDataCell.CellBigLabel.text="EGP 999.99"
                }else if Dots.currentPage==1{
                    insightDataCell.CellSmallLabel.text="Expenses in March"
                    insightDataCell.CellBigLabel.text="EGP 0"
                }else if Dots.currentPage==2{
                    insightDataCell.CellSmallLabel.text="Expenses in February"
                    insightDataCell.CellBigLabel.text="EGP 0"
                }else{
                    insightDataCell.CellSmallLabel.text="Expenses in January"
                    insightDataCell.CellBigLabel.text="EGP 0"
                }
                return insightDataCell
            }else{
                if Dots.currentPage != 0{
                    insightSetBudgetCell.BigLabel.isHidden=true
                    insightSetBudgetCell.SmallLabel.text="No budget was set for this month"
                    insightSetBudgetCell.LeftButton.isHidden=true
                    insightSetBudgetCell.RightButton.isHidden=true
                }
                else{
                    insightSetBudgetCell.BigLabel.isHidden=false
                    insightSetBudgetCell.SmallLabel.text="Control your spendings"
                    insightSetBudgetCell.LeftButton.isHidden=false
                    insightSetBudgetCell.RightButton.isHidden=false
                }
                return insightSetBudgetCell
            }
        }else{
            let CategoryCell=CategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionCell", for: indexPath) as! CategoriesCollectionCell
            
            let SecondCategoryCell=CategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCategoriesCollectionCell", for: indexPath) as! SecondCategoriesCollectionCell
            
            if Dots.currentPage == 0{
                if SelectedSegmentIndex==0{
                    CategoryCell.CellLabel.text="Transfers"
                    CategoryCell.LeftButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
                }else{
                    CategoryCell.CellLabel.text="Hazem el-Gendy"
                    CategoryCell.LeftButton.setImage(UIImage(systemName: "person.fill.questionmark"), for: .normal)
                }
                return CategoryCell
                
            }else{
                
                if SelectedSegmentIndex == 0{
                    if indexPath.row==0{
                        SecondCategoryCell.CellLabel.text="Groceries"
                        
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
                        
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "myColor1")
                        
                    }else if indexPath.row==1{
                        SecondCategoryCell.CellLabel.text="Shopping"
                        
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "handbag.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
                        
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "myColor2")

                    }else if indexPath.row==2{
                        SecondCategoryCell.CellLabel.text="Resturants"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "fork.knife"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "myColor3")

                    }else if indexPath.row==3{
                        SecondCategoryCell.CellLabel.text="Transport"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "car.rear.road.lane"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "myColor4")

                    }else{
                        SecondCategoryCell.CellLabel.text="Travel"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "globe.europe.africa.fill"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = UIColor(named: "myColor5")
                    }
                }else{
                    if indexPath.row==0{
                        SecondCategoryCell.CellLabel.text="McDonald's"
                        
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "m.circle.fill"), for: .normal)
                        
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = .systemYellow
                        
                    }else if indexPath.row==1{
                        SecondCategoryCell.CellLabel.text="Netflix"
                        
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "n.circle.fill"), for: .normal)
                        
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = .systemRed

                    }else if indexPath.row==2{
                        SecondCategoryCell.CellLabel.text="Spotify"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "s.circle.fill"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = .systemGreen

                    }else if indexPath.row==3{
                        SecondCategoryCell.CellLabel.text="Starbucks Cafe"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "cup.and.saucer.fill"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = .systemMint

                    }else{
                        SecondCategoryCell.CellLabel.text="Uber"
                        SecondCategoryCell.LeftButton.setImage(UIImage(systemName: "u.circle.fill"), for: .normal)
                        SecondCategoryCell.LeftButton.configuration?.baseForegroundColor = .systemBlue
                    }
                }
                return SecondCategoryCell
                
            }
        }
    }
    
}



//MARK: - UICollectionViewDelegate
extension InsightVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == InsightCollectionView{
            if indexPath.row==1 && Dots.currentPage==0{
                performSegue(withIdentifier: "InsightToSetBudget", sender: self)
            }else{
                print(indexPath)
            }
        }else{
            if Dots.currentPage != 0{
                if SelectedSegmentIndex==0{
                    performSegue(withIdentifier: "InsightToCategories", sender: self)
                }else{
                    performSegue(withIdentifier: "InsightToMerchants", sender: self)
                }
                
            }else{
                performSegue(withIdentifier: "InsightToTransfers", sender: self)
            }
            
        }
        
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension InsightVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout=collectionViewLayout as! UICollectionViewFlowLayout
        //flowLayout.minimumLineSpacing=15
        
        if collectionView==InsightCollectionView{
            flowLayout.sectionInset=UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            
            //Insight Cell
            if indexPath.row==0{
                return CGSize(width: (collectionView.bounds.width)-10, height: (collectionView.bounds.width)-80)
                
            //Set budget Cell
            }else{
                return CGSize(width: (collectionView.bounds.width)-10, height: (collectionView.bounds.width)/4-10)
            }
            
            //Category Cell
        }else{
            flowLayout.sectionInset=UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
            return CGSize(width: (collectionView.bounds.width), height: (collectionView.bounds.width)/4-10)
        }
    }
    
    
}
