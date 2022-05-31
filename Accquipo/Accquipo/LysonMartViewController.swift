//
//  LysonMartViewController.swift
//  Accquipo
//
//  Created by apple on 30/05/22.
//

import UIKit
struct LysonModel {
    let bill :String
    let time : String
    let cost : Float
    let isCleared: Bool
}
class LysonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var billLabel1: UILabel!
    @IBOutlet var timeLabel1: UILabel!
    @IBOutlet var costLabel1: UILabel!
    @IBOutlet var balanceLabel1: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
   }
class LysonMartViewController: UIViewController {
    private let reuseIdentifier = "Cell"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let titleElementKind = "title-element-kind"
    
    
    @IBOutlet var collectionView : UICollectionView!
    
    var data = [LysonModel(bill: "Fresh Flavour", time: "May 23 4:46 PM", cost: 7808.00, isCleared: false),LysonModel(bill: "Easy Mart", time: "May 05 2:07 PM", cost: 500.00, isCleared: true),LysonModel(bill: "K.S and Sons", time: "April 18 7:46 AM", cost: 3000.00, isCleared: false),LysonModel(bill: "Easy Mart", time: "April 11 3:28 PM", cost: 62.00, isCleared: false),LysonModel(bill: "KJ Lyson", time: "May 23 4:46 PM", cost: 7808.00, isCleared: false),LysonModel(bill: "Lyson Mart", time: "May 23 4:46 PM", cost: 500.0, isCleared: true),LysonModel(bill: "Easy Mart", time: "Feb 23 4:46 PM", cost: 3000.00, isCleared: false),LysonModel(bill: "Arizon Supermarket", time: "Feb 14 1:00 PM", cost: 62.00, isCleared: false),LysonModel(bill: "Fresh Flavour", time: "Feb 10 3:11 PM", cost: 7808.00, isCleared: false),LysonModel(bill: "Fresh Flavour", time: "Feb 3 6:33 PM", cost: 500.00, isCleared: true),LysonModel(bill: "Easy Mart", time: "Jan 29 4:23 PM", cost: 3000.00, isCleared: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        collectionView.collectionViewLayout = createLayout()
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true

    }

}

extension LysonMartViewController {
    
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
extension LysonMartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! LysonCollectionViewCell
        
        
        let content = data[indexPath.item]
    
        
        cell.billLabel1.text = content.bill
        cell.timeLabel1.text = content.time
        cell.billLabel1.backgroundColor = .systemGray6
        cell.costLabel1.text = String(content.cost)
        
        if content.isCleared {
            cell.balanceLabel1.text = "✔️ Cleared"
            cell.balanceLabel1.textColor = .gray
            
            cell.costLabel1.textColor = .green
        } else {
            let balance = content.isCleared ? "✔️" : "OST \(content.cost/2)"

            cell.balanceLabel1.text = balance
            cell.balanceLabel1.textColor = .red
            cell.costLabel1.textColor = .black
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
