//
//  LaylandStoresViewController.swift
//  Accquipo
//
//  Created by apple on 26/05/22.
//

import UIKit
struct LaylandModel {
    let bill :String
    let time : String
    let cost : Float
    let isCleared: Bool
    
}
class LaylandCollectionViewCell: UICollectionViewCell {
    @IBOutlet var billLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var costLabel : UILabel!
    @IBOutlet var balanceLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
   }



class LaylandStoresViewController: UIViewController {
    private let reuseIdentifier = "Cell"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let titleElementKind = "title-element-kind"
    
    
    @IBOutlet var collectionView : UICollectionView!
    
    var data = [LaylandModel(bill: "Fresh Flavour", time: "May 23 4:46 PM", cost: 7808.00, isCleared: false),LaylandModel(bill: "Easy Mart", time: "May 05 2:07 PM", cost: 500.00, isCleared: true),LaylandModel(bill: "K.S and Sons", time: "April 18 7:46 AM", cost: 3000.00, isCleared: false),LaylandModel(bill: "Easy Mart", time: "April 11 3:28 PM", cost: 62.00, isCleared: false),LaylandModel(bill: "KJ Lyson", time: "May 23 4:46 PM", cost: 7808.00, isCleared: false),LaylandModel(bill: "Lyson Mart", time: "May 23 4:46 PM", cost: 500.0, isCleared: true),LaylandModel(bill: "Easy Mart", time: "Feb 23 4:46 PM", cost: 3000.00, isCleared: false),LaylandModel(bill: "Arizon Supermarket", time: "Feb 14 1:00 PM", cost: 62.00, isCleared: false),LaylandModel(bill: "Fresh Flavour", time: "Feb 10 3:11 PM", cost: 7808.00, isCleared: false),LaylandModel(bill: "Fresh Flavour", time: "Feb 3 6:33 PM", cost: 500.00, isCleared: true),LaylandModel(bill: "Easy Mart", time: "Jan 29 4:23 PM", cost: 3000.00, isCleared: false)]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        collectionView.collectionViewLayout = createLayout()
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
    }
 
}

extension LaylandStoresViewController {
    
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
        
        let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44))
        let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: titleSize,
            elementKind: titleElementKind,
            alignment: .top )
        
        section.boundarySupplementaryItems = [titleSupplementary]
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(
            SectionBackgroundDecorationView.self,
            forDecorationViewOfKind: sectionBackgroundDecorationElementKind)
        layout.register(
            TitleSupplementaryView.self,
            forDecorationViewOfKind: titleElementKind)

        return layout
    }
}
extension LaylandStoresViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! LaylandCollectionViewCell
        
        
        let content = data[indexPath.item]
    
        
        cell.billLabel.text = content.bill
        cell.timeLabel.text = content.time
        cell.billLabel.backgroundColor = .systemGray6
        cell.costLabel.text = String(content.cost)
        
        if content.isCleared {
            cell.balanceLabel.text = "✔️ Cleared"
            cell.balanceLabel.textColor = .gray
            
            cell.costLabel.textColor = .green
        } else {
            let balance = content.isCleared ? "✔️" : "OST \(content.cost/2)"

            cell.balanceLabel.text = balance
            cell.balanceLabel.textColor = .red
            
            cell.costLabel.textColor = .black
        }
            

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            let title = "Transactions"


            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.textColor = .black
            view.label.font = .boldSystemFont(ofSize: 30)

            return view
        }


        return UICollectionReusableView()

    }
    
}

