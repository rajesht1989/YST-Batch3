//
//  HalfScreenViewController.swift
//  Accquipo
//
//  Created by apple on 24/05/22.
//

import UIKit
struct HalfScreenModel {
    let content :String
}
class HalfScreenCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet var label : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
       
        clipsToBounds = true
}
}
class HalfScreenViewController: UIViewController {

    @IBAction func closeAction(_ sender: Any) {
        
        dismiss(animated: true)
    }
    private let reuseIdentifier = "Cell"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    
    @IBOutlet var collectionView : UICollectionView!
    
    var data = [HalfScreenModel(content: "Calender "),HalfScreenModel(content: "Calculator"),HalfScreenModel(content: "Share Bank Details"),HalfScreenModel(content: "Settings "),HalfScreenModel(content: "Backup & Restore "),HalfScreenModel(content: "Help & Support "),HalfScreenModel(content: "Rate the app ")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Section Background Decoration View"
        collectionView.collectionViewLayout = createLayout()
        self.view.clipsToBounds = true
        view.layer.cornerRadius = 20
        

    }
}
 
extension HalfScreenViewController {
    
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

extension HalfScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indexPath.item == 0 ? "Cell1" : "Cell", for: indexPath)as! HalfScreenCollectionViewCell
        
        
        let content = data[indexPath.item]
        
        cell.label.text = content.content
       
        return cell
    }
    
}

