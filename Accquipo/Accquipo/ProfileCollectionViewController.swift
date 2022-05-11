//
//  ProfileCollectionViewController.swift
//  Accquipo
//
//  Created by apple on 10/05/22.
//

import UIKit

struct ProfileModel {
    let content: String
    
}

class ProfileCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageview : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

class ProfileFieldCell: UICollectionViewCell {
    @IBAction func countryTextField(_ sender: Any) {
        
    }
    @IBAction func stateTextField(_ sender: Any) {
        
    }
    @IBAction func cityTextField(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
class ContactFieldCell: UICollectionViewCell{
    
    @IBAction func PhoneField(_ sender: Any) {
    }
    
    @IBAction func EmailField(_ sender: Any) {
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    
    
}
class ProfileCollectionViewController: UIViewController {
    
    private let reuseIdentifier = "Cell"
    private let profileCellreuseIdentifier = "Cell1"
    private let contactCellreuseIdentifier = "Cell2"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
    }
}


  extension ProfileCollectionViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
            cell.imageview.image = UIImage(named: "profile_img")
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileCellreuseIdentifier, for: indexPath) as! ProfileFieldCell
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contactCellreuseIdentifier, for: indexPath) as! ContactFieldCell
            
            return cell
            
        }
        
    }
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          if kind == titleElementKind {
              var title = ""
              switch indexPath.section {
              case 0:
              title = ""
              case 1:
                  title = "Location"
              case 2:
                  title = "Contact"
              case 3:
                  title = "Firm Details"
              default: break
              }
              
              let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
              view.label.text = title
              return view
          }
          
          
          return UICollectionReusableView()
      }
      
  }
      
extension ProfileCollectionViewController {
        
        func createLayout() -> UICollectionViewLayout {
            
        func section() -> NSCollectionLayoutSection {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(120))
                let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                
                let spacing = CGFloat(10)
                
                cell.interItemSpacing = .fixed(spacing)
            
                
                let section = NSCollectionLayoutSection(group: cell)
                
                section.interGroupSpacing = spacing
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: titleElementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            
           
                return section
            }
            
            return UICollectionViewCompositionalLayout(section: section())
            
           
            
            
        }
    
}

  

