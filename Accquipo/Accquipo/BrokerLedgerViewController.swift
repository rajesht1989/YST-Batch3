//
//  BrokerLedgerViewController.swift
//  Accquipo
//
//  Created by apple on 30/05/22.
//

import UIKit
struct BrokerModel {
    let name: String
    let place: String
    let dealsWith: String
}

class BrokerCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var dealsWithLabel: UILabel!
}

class BrokerLedgerViewController: UIViewController {
    private let reuseIdentifier = "Cell"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var collectionView: UICollectionView!
    
    let data = [[BrokerModel(name: "A K Dixit", place: "Mumbai, Maharastra",dealsWith: "Deals in Dry Fruits ")],[BrokerModel(name: "Larry sen", place: "Nagpur, Maharastra",dealsWith: "Deals in Dry Fruits ")],[BrokerModel(name: "Deepansh shetty", place: "Mysore, Karnataka",dealsWith: "Deals in Dry Spices ")],[BrokerModel(name: "Arush saxena", place: "Ahemadabad, Gujarat",dealsWith: "Deals in Dry Grains ")],[BrokerModel(name: "Aryon roy", place: "Pune, Maharastra",dealsWith: "Deals in Dry Dates ")],[BrokerModel(name: "Ruksar sheikh", place: "Bubneshwar, Odisa",dealsWith: "Deals in Dry Fruits ")],[BrokerModel(name: "M K Mittal ", place: "Chennai, Tamilnadu",dealsWith: "Deals in Dry Fruits ")],[BrokerModel(name: "A K Dixit", place: "Mumbai, Maharastra",dealsWith: "Deals in Dry Fruits ")]]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LysonMart Stores"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
    }
}

extension BrokerLedgerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                navigationController?.pushViewController(storyboard!.instantiateViewController(withIdentifier: ""), animated: true)
            default:break
            }
        default:break
        }
    }
}
extension BrokerLedgerViewController {
    
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

extension BrokerLedgerViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BrokerCollectionViewCell
        
        let content = data[indexPath.section][indexPath.item]
        
        cell.nameLabel.text = content.name
        cell.placeLabel.text = content.place
        cell.dealsWithLabel.text = content.dealsWith
        
        
        
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
