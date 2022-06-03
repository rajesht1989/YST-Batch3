//
//  BrokerDetailsViewController.swift
//  Accquipo
//
//  Created by apple on 31/05/22.
//

import UIKit
struct BrokerDetailsModel {
    let content: String
    
}

class BrokerDetailsCollectionViewCell: UICollectionViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

class PersonalDetailsCell: UICollectionViewCell {
    
    @IBOutlet var firmName1Field: UITextField!
    @IBOutlet var maharastra1Field: UITextField!
    @IBOutlet var state1Field: UITextField!
    @IBOutlet var city1Field: UITextField!
    @IBOutlet var pinCode1Field: UITextField!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        
        
        let countryFieldButton = UIButton(type: .custom)
        countryFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        maharastra1Field.rightView = countryFieldButton
        maharastra1Field.rightViewMode = .always
        
        let stateFieldButton = UIButton(type: .custom)
        stateFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        state1Field.rightView = stateFieldButton
        state1Field.rightViewMode = .always
        
        let cityFieldButton = UIButton(type: .custom)
        cityFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        city1Field.rightView = cityFieldButton
        city1Field.rightViewMode = .always
        
        let pinCodeFieldButton = UIButton(type: .custom)
        pinCodeFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        pinCode1Field.rightView = pinCodeFieldButton
        pinCode1Field.rightViewMode = .always
        
        
        
    }
}
class ContactField1Cell: UICollectionViewCell{
    
  
    
    @IBOutlet var PhoneField: UITextField!
    
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var chooseProductField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        
        let chooseProductFieldButton = UIButton(type: .custom)
        chooseProductFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        chooseProductField.rightView = chooseProductFieldButton
        chooseProductField.rightViewMode = .always
        
    }
    
    
    
}



class BrokerDetailsViewController: UIViewController {
    
    private let PersonalDetailsCellreuseIdentifier = "Cell1"
    private let contact1CellreuseIdentifier = "Cell2"
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

extension BrokerDetailsViewController: UICollectionViewDataSource,UICollectionViewDelegate{
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      
      return 2
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
      return 1
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      switch indexPath.section {
     
          
      case 0:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalDetailsCellreuseIdentifier, for: indexPath) as! PersonalDetailsCell
          
          return cell
          
      default:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contact1CellreuseIdentifier, for: indexPath) as! ContactField1Cell
          
          return cell
          
      }
      
  }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            var title = ""
            switch indexPath.section {
            case 0:
            title = "Personal Details"
            case 1:
                title = "Contacts"
            
            default: break
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.font = .boldSystemFont(ofSize: 14)
            return view
        }
        
        
        return UICollectionReusableView()
    }

}
    

extension BrokerDetailsViewController {
        
        func createLayout() -> UICollectionViewLayout {
            
        func firmSection() -> NSCollectionLayoutSection {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(100))
                let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                
                let spacing = CGFloat(10)
                
                cell.interItemSpacing = .fixed(spacing)
            
                
                let firmSection = NSCollectionLayoutSection(group: cell)
                
            firmSection.interGroupSpacing = spacing
                
            firmSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: titleElementKind,
                alignment: .top)
            firmSection.boundarySupplementaryItems = [titleSupplementary]
            
           
                return firmSection
            }
            func contactSection() -> NSCollectionLayoutSection {
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                          heightDimension: .fractionalHeight(1))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .estimated(125))
                    let cell = NSCollectionLayoutGroup.horizontal(layoutSize: cellSize, subitem: item, count: 1)
                    
                    let spacing = CGFloat(10)
                    
                    cell.interItemSpacing = .fixed(spacing)
                
                    
                    let contactSection = NSCollectionLayoutSection(group: cell)
                    
                contactSection.interGroupSpacing = spacing
                    
                contactSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: titleSize,
                    elementKind: titleElementKind,
                    alignment: .top)
                contactSection.boundarySupplementaryItems = [titleSupplementary]
                    return contactSection
                }
            let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
              switch sectionIndex {
                case 0 :
                  return firmSection()
                case 1 :
                  return contactSection()
                default :
                  return firmSection()
            }
            
            
        }
            
         return layout
            
            
        }
    
}

