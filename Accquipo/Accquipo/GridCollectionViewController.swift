//
//  GridCollectionViewController.swift
//  Accquipo
//
//  Created by apple on 28/04/22.
//

import UIKit

private let reuseIdentifier = "Cell"
private let  graphCellreuseIdentifier = "graphCell"

class GridCollectionViewCell:UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
}

class GridCollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }
    

}
extension GridCollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GridCollectionViewCell
            switch indexPath.row {
            case 0:
                cell.imageView.image = UIImage(named: "purchase")
                cell.itemLabel.text = "Purchase Ledger Account"
            case 1:
                cell.imageView.image = UIImage(named: "sales")
                cell.itemLabel.text = "Sales Ledger Account"
            case 2:
                cell.imageView.image = UIImage(named: "stock")
                cell.itemLabel.text = "Stock Ledger Account"
            case 3:
                cell.imageView.image = UIImage(named: "broker")
                cell.itemLabel.text = "Broker Ledger Account"
            default:break
            }
            return cell
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: graphCellreuseIdentifier, for: indexPath)
            return cell
        default:break
        }
        return UICollectionViewCell()
        
    }
}
extension GridCollectionViewController {
    func createLayout() -> UICollectionViewLayout {
        
    func gridSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(220))
            let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 2)
            
            let spacing = CGFloat(10)
            
            cell.interItemSpacing = .fixed(spacing)
        
            
            let section = NSCollectionLayoutSection(group: cell)
            
            section.interGroupSpacing = spacing
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            return section
        }
        
    func graphSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(220))
            let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
            
            let spacing = CGFloat(10)
            
            
            cell.interItemSpacing = .fixed(spacing)
        
            
            let section = NSCollectionLayoutSection(group: cell)
            
            section.interGroupSpacing = spacing
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            return section
        }
        
        
            let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
              switch sectionIndex {
                case 0 :
                  return gridSection()
                case 1 :
                  return graphSection()
                default :
                  return gridSection()
            }
            
            
        }
        return layout
        
    }
}


