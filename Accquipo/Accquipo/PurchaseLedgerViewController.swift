//
//  PurchaseLedgerViewController.swift
//  Accquipo
//
//  Created by apple on 25/05/22.
//

import UIKit
struct PurchaseModel {
    let companyName: String
    let location: String
    let deals: String
}

class PurchaseCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dealsLabel: UILabel!
    
}

class PurchaseLedgerViewController: UIViewController {
    
    private let reuseIdentifier = "Cell"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    let data = [[PurchaseModel(companyName: "Layland stores", location: "Mumbai, Maharastra",deals: "Deals in Dry Fruits ")],[PurchaseModel(companyName: "Fresh Flavour", location: "Nagpur, Maharastra",deals: "Deals in Dry Fruits ")],[PurchaseModel(companyName: "Dnat Traders", location: "Mysore, Karnataka",deals: "Deals in Dry Spices ")],[PurchaseModel(companyName: "K.S Sons 03 ", location: "Ahemadabad, Gujarat",deals: "Deals in Dry Grains ")],[PurchaseModel(companyName: "K.J Lyson Mart stores", location: "Pune, Maharastra",deals: "Deals in Dry Dates ")],[PurchaseModel(companyName: "MG Mart Trading Company ", location: "Bubneshwar, Odisa",deals: "Deals in Dry Fruits ")],[PurchaseModel(companyName: "Arizon Super Market ", location: "Chennai, Tamilnadu",deals: "Deals in Dry Fruits ")],[PurchaseModel(companyName: "Layland stores", location: "Mumbai, Maharastra",deals: "Deals in Dry Fruits ")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Layland Stores"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
    }
}
extension PurchaseLedgerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                navigationController?.pushViewController(storyboard!.instantiateViewController(withIdentifier: "LaylandStoresViewController"), animated: true)
            default:break
            }
        default:break
        }
    }
}
extension PurchaseLedgerViewController {
    
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

extension PurchaseLedgerViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PurchaseCollectionViewCell
        
        let content = data[indexPath.section][indexPath.item]
        
        cell.companyNameLabel.text = content.companyName
        cell.locationLabel.text = content.location
        cell.dealsLabel.text = content.deals
        
    return cell


}
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            let title = "dealers"
            
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.textColor = .gray
            view.label.font = .boldSystemFont(ofSize: 16)
            
            return view
        }
        
        
        return UICollectionReusableView()
    }
    
}

