//
//  CashViewController.swift
//  Accquipo
//
//  Created by apple on 05/05/22.
//

import UIKit
struct CashModel {
    let content :String
    let date : String
    let cash : Float
    let isUp: Bool
    
}


class CashCollectionViewCell: UICollectionViewCell {
    @IBOutlet var contentLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var cashLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
   }

class CashViewController: UIViewController {
    private let reuseIdentifier = "Cell"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"

    @IBOutlet var collectionView : UICollectionView!
    
    var data = [CashModel(content: "Fresh Flavour", date: "May 23 4:46 PM", cash: 7808.00, isUp: false),CashModel(content: "Easy Mart", date: "May 05 2:07 PM", cash: 500.00, isUp: true),CashModel(content: "K.S and Sons", date: "April 18 7:46 AM", cash: 3000.00, isUp: false),CashModel(content: "Easy Mart", date: "April 11 3:28 PM", cash: 62.00, isUp: false),CashModel(content: "KJ Lyson", date: "May 23 4:46 PM", cash: 7808.00, isUp: false),CashModel(content: "Lyson Mart", date: "May 23 4:46 PM", cash: 500.0, isUp: true),CashModel(content: "Easy Mart", date: "Feb 23 4:46 PM", cash: 3000.00, isUp: false),CashModel(content: "Arizon Supermarket", date: "Feb 14 1:00 PM", cash: 62.00, isUp: false),CashModel(content: "Fresh Flavour", date: "Feb 10 3:11 PM", cash: 7808.00, isUp: false),CashModel(content: "Fresh Flavour", date: "Feb 3 6:33 PM", cash: 500.00, isUp: true),CashModel(content: "Easy Mart", date: "Jan 29 4:23 PM", cash: 3000.00, isUp: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Section Background Decoration View"
        collectionView.collectionViewLayout = createLayout()
        
        
    }

}
extension CashViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}


extension CashViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! CashCollectionViewCell
        
        
        let content = data[indexPath.item]
    
        
        cell.contentLabel.text = content.content
        cell.dateLabel.text = content.date
        
        let symbol = content.isUp ? "+" : "-"
        cell.cashLabel.text = symbol + String(content.cash)
        
        cell.cashLabel.textColor = content.isUp ? .green : .red

        return cell
    }
    
    
    
}


