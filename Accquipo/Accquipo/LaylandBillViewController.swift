//
//  LaylandBillViewController.swift
//  Pods
//
//  Created by apple on 03/06/22.
//

import UIKit

class LaylandBillCollectionViewCell: UICollectionViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
class WalnutCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
class TensilsCell: UICollectionViewCell {
            
            override func awakeFromNib() {
                super.awakeFromNib()
                layer.cornerRadius = 10
                clipsToBounds = true
            }
}
            
class TransactionsCell: UICollectionViewCell {
                
                override func awakeFromNib() {
                    super.awakeFromNib()
                    layer.cornerRadius = 10
                    clipsToBounds = true
                }
}
class LaylandBillViewController: UIViewController {
    
    private let WalnutCellreuseIdentifier = "Cell1"
    private let TensilsCellreuseIdentifier = "Cell2"
    private let TransactionsCellreuseIdentifier = "Cell3"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var collectionView : UICollectionView!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        


        
    }


}
extension LaylandBillViewController: UICollectionViewDataSource,UICollectionViewDelegate{
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      
      return 3
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
      return 1
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      switch indexPath.section {
     
          
      case 0:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalnutCellreuseIdentifier, for: indexPath) as! WalnutCell
          
          return cell
          
      case 1:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TensilsCellreuseIdentifier, for: indexPath) as! TensilsCell
          
          return cell
      default:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransactionsCellreuseIdentifier, for: indexPath) as! TransactionsCell
          
          return cell
          
      }
      
  }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            var title = "Layland Stores"
            switch indexPath.section {
            case 0:
            title = "Bill No : 04658"
            case 1:
                title = ""
            case 2:
                title = "Payment"
         
            default: break
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.font = .boldSystemFont(ofSize: 14)
            return view
        }
        
        
        return UICollectionReusableView()
    }
    
}
    

    extension LaylandBillViewController {
            
            func createLayout() -> UICollectionViewLayout {
                
            func walnutSection() -> NSCollectionLayoutSection {
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                          heightDimension: .fractionalHeight(1))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .estimated(145))
                    let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                    
                    let spacing = CGFloat(10)
                    
                    cell.interItemSpacing = .fixed(spacing)
                
                    
                    let firmSection = NSCollectionLayoutSection(group: cell)
                    
                firmSection.interGroupSpacing = spacing
                    
                firmSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: titleSize,
                    elementKind: titleElementKind,
                    alignment: .top)
                firmSection.boundarySupplementaryItems = [titleSupplementary]
                
               
                    return firmSection
                }
                func tensilsSection() -> NSCollectionLayoutSection {
                        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                              heightDimension: .fractionalHeight(1))
                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                        
                        let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(145))
                        let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                        
                        let spacing = CGFloat(10)
                        
                        cell.interItemSpacing = .fixed(spacing)
                    
                        
                        let contactSection = NSCollectionLayoutSection(group: cell)
                        
                    contactSection.interGroupSpacing = spacing
                        
                    contactSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                    
                    let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .estimated(44))
                    let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: titleSize,
                        elementKind: titleElementKind,
                        alignment: .top)
                    contactSection.boundarySupplementaryItems = [titleSupplementary]
                        return contactSection
                    }
                func transactionsSection() -> NSCollectionLayoutSection {
                        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                              heightDimension: .fractionalHeight(1))
                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                        
                        let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(210))
                        let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                        
                        let spacing = CGFloat(10)
                        
                        cell.interItemSpacing = .fixed(spacing)
                    
                        
                        let contactSection = NSCollectionLayoutSection(group: cell)
                        
                    contactSection.interGroupSpacing = spacing
                        
                    contactSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                    
                    let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .estimated(44))
                    let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: titleSize,
                        elementKind: titleElementKind,
                        alignment: .top)
                    contactSection.boundarySupplementaryItems = [titleSupplementary]
                        return contactSection
                    }
                let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                  switch sectionIndex {
                    case 0 :
                      return walnutSection()
                    case 1 :
                      return tensilsSection()
                  case 2 :
                    return transactionsSection()
                    default :
                      return walnutSection()
                }
                
                
            }
                
             return layout
                
                
            }
        
    }

