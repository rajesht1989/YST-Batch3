//
//  StockProductDetailsViewController.swift
//  Accquipo
//
//  Created by apple on 01/06/22.
//

import UIKit
struct StockBrokerDEtailsModel {
    let content: String
    
}


class ProductDetailsFieldCell: UICollectionViewCell {
    
    @IBOutlet var chooseCatagoryField: UITextField!
    @IBOutlet var productNameField: UITextField!
    @IBOutlet var hsnCodeField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        chooseCatagoryField.rightView = button
        chooseCatagoryField.rightViewMode = .always
        
        
    }
}




class StockProductDetailsViewController: UIViewController {
    private let ProductDetailsreuseIdentifier = "Cell1"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var collectionView : UICollectionView!

    override func viewDidLoad(){
    
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        
    }
}
extension StockProductDetailsViewController: UICollectionViewDataSource,UICollectionViewDelegate{
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      
      return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
      return 1
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
 
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsreuseIdentifier, for: indexPath) as! ProductDetailsFieldCell
          
         
          return cell
          
      }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            var title = ""
            switch indexPath.section {
            case 0:
            title = "Product Details"
          
         
            default: break
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.font = .boldSystemFont(ofSize: 16)
            return view
        }
        
        
        return UICollectionReusableView()
    }
    
    
  }




extension StockProductDetailsViewController {
        
        func createLayout() -> UICollectionViewLayout {
            
        func section() -> NSCollectionLayoutSection {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(145))
                let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                
                let spacing = CGFloat(10)
                
                cell.interItemSpacing = .fixed(spacing)
            
                
                let section = NSCollectionLayoutSection(group: cell)
                
                section.interGroupSpacing = spacing
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: titleElementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            
           
                return section
            }
            
            return UICollectionViewCompositionalLayout(section: section())
            
           
            
            
        }
    
}

