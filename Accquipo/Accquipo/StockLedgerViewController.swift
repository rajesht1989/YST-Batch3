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
        navigationItem.title = "LysonMart Stores"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)

               
    }
    

}
extension StockLedgerViewController {
    
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
     

        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
            elementKind: sectionBackgroundDecorationElementKind)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.decorationItems = [sectionBackgroundDecoration]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(
            SectionBackgroundDecorationView.self,
            forDecorationViewOfKind: sectionBackgroundDecorationElementKind)
        return layout
    }
}

extension StockLedgerViewController: UICollectionViewDataSource {
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            let title = "Customers"
            
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.textColor = .gray
            view.label.font = .boldSystemFont(ofSize: 16)
            
            return view
        }
        
        
        return UICollectionReusableView()
    }
    

}
