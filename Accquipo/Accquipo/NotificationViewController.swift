//
//  NotificationViewController.swift
//  Accquipo
//
//  Created by apple on 05/05/22.
//

import UIKit

struct NotificationModel {
    let content: String
    let date: String
}


class NotificationCollectionViewCell: UICollectionViewCell {
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
}


class TitleSupplementaryView: UICollectionReusableView {
    let label = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension TitleSupplementaryView {
    func configure() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = UIFont.preferredFont(forTextStyle: .title2)
    }
}


class NotificationViewController: UIViewController {

    private let reuseIdentifier = "Cell"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"

    @IBOutlet var collectionView: UICollectionView!
    
    let data = [[NotificationModel(content: "Easy Mart deposited Rs.7000 for Bill No 8663 for axis bank", date: "May 22 6:59 PM"),NotificationModel(content: "LayLand Store deposited Rs.13000 for Bill No 63459 via Citi Bank", date: "May 22 3:45 PM"), NotificationModel(content: "K.S & Sons credited Rs.92000 for Bill No 9090 through RTGS via HDFC Bank", date: "May 21 6:59 PM"),NotificationModel(content: "Arizona Super Market deposited Rs.5100 for Bill No 2366 via SBI Bank", date: "May 21 6:59 PM")],[NotificationModel(content: "Easy Mart deposited Rs.7000 for Bill No 8663 for axis bank", date: "May 22 6:59 PM"), NotificationModel(content: "LayLand Store deposited Rs.13000 for Bill No :63459 via Citi Bank", date: "May 21 3:30 PM"),NotificationModel(content: "Arizona Super Market deposited Rs.5100 for Bill No 2366 via SBI Bank", date: "May 22 6:59 PM"),NotificationModel(content: "K.S & Sons credited Rs.92000 for Bill No 9090 through RTGS via HDFC Bank", date: "May 22 6:59 PM")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Section Background Decoration View"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
    }
}

extension NotificationViewController {
    
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
        //
        
//        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
//            elementKind: sectionBackgroundDecorationElementKind)
//        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//        section.decorationItems = [sectionBackgroundDecoration]

        let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44))
        let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: titleSize,
            elementKind: titleElementKind,
            alignment: .top)
        section.boundarySupplementaryItems = [titleSupplementary]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
//        layout.register( UICollectionReusableView.self, forDecorationViewOfKind: sectionBackgroundDecorationElementKind)
        return layout
    }
}

extension NotificationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NotificationCollectionViewCell
        
        let content = data[indexPath.section][indexPath.item]
        
        cell.contentLabel.text = content.content
        cell.dateLabel.text = content.date
    
    return cell


}
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            var title = ""
            switch indexPath.section {
            case 0:
                title = "Recent"
            case 1:
                title = "Last Week"
            default: break
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            return view
        }
        
        
        return UICollectionReusableView()
    }
    
}

       


    









