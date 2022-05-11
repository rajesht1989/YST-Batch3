//
//  BankViewController.swift
//  Accquipo
//
//  Created by apple on 05/05/22.
//

import UIKit

struct BankModel {
    let content :String
}

class BankCollectionViewCell: UICollectionViewCell {
    @IBOutlet var contentLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    
}

class BankViewController: UIViewController {
    
    private let reuseIdentifier = "Cell"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    
    @IBOutlet var collectionView : UICollectionView!
    var data = [BankModel(content: "Withdraw & Deposit"),BankModel(content: "RTGS"),BankModel(content: "Cheque")]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Section Background Decoration View"
        collectionView.collectionViewLayout = createLayout()
        
    }
    
}

extension BankViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}

extension BankViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! BankCollectionViewCell
        
        
        let content = data[indexPath.item]
        
        cell.contentLabel.text = content.content
        return cell
    }
}

