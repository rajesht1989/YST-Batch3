//
//  StockLedgerViewController.swift
//  Accquipo
//
//  Created by apple on 31/05/22.
//

import UIKit
struct StockModel {
    let name: String
    let code: String
    let percentage: String
}

class StockCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
}


class StockLedgerViewController: UIViewController {
    private let reuseIdentifier = "Cell"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var collectionView: UICollectionView!
    
    let data = [[StockModel(name: "Walnut", code: "HSN code 8023100",percentage:"% 18.00")],[StockModel(name: "Lensils Powder ", code: "HSN code 07134000",percentage:"% 1.78")],[StockModel(name: "Dry Dates", code: "HSN code 0841010 ",percentage: "% 18.00")],[StockModel(name: "Cardamom oleoresin", code: "HSN code 33012922",percentage: " % 12.00")],[StockModel(name: "Coriander Powder", code: "HSN code 0862",percentage: "% 8.69")],[StockModel(name: "Walnut", code: "HSN code 8023100",percentage: "% 15.00")],[StockModel(name: "Cardamom oleoresin", code: "HSN code 07134000 ",percentage: " % 3.57")],[StockModel(name: "Lensils Powder", code: "HSN code 0841010",percentage: "% 11.90")]]


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stock Account"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
               
    }
    

}
extension StockLedgerViewController {
    
    func createLayout() -> UICollectionViewLayout {
        
        
        
            let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
             
                if sectionIndex == 0 {
                    
                
                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: titleSize,
                    elementKind: self.titleElementKind,
                    alignment: .top )
                
                section.boundarySupplementaryItems = [titleSupplementary]
                }
              return section
            
            
        }
        return layout
        
    }
    
    
}

extension StockLedgerViewController: UICollectionViewDataSource ,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StockCollectionViewCell
        
        let content = data[indexPath.section][indexPath.item]
        
        cell.nameLabel.text = content.name
        cell.codeLabel.text = content.code
        cell.percentageLabel.text = content.percentage
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                navigationController?.pushViewController(storyboard!.instantiateViewController(withIdentifier: "StockProductDetailsViewController"), animated: true)
            default:break
            }
        default:break
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            let title = "Products"
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.textColor = .black
            view.label.font = .boldSystemFont(ofSize: 16)
            
            return view
        }
        return UICollectionReusableView()
    }
    

      
    }


