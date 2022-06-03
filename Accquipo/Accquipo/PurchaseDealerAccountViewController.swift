//
//  PurchaseDealerAccountViewController.swift
//  Accquipo
//
//  Created by apple on 01/06/22.
//

import UIKit
struct PurchaseDealerModel {
    let content: String
    
}

class PurchaseDealerCollectionViewCell: UICollectionViewCell {
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

class FirmFieldCell: UICollectionViewCell {
    
    @IBOutlet var firmNameField: UITextField!
    @IBOutlet var maharastraField: UITextField!
    @IBOutlet var stateField: UITextField!
    @IBOutlet var cityField: UITextField!
    @IBOutlet var pinCodeField: UITextField!
    @IBOutlet var gstNoField: UITextField!
    @IBOutlet var brokerNameField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        
        let brokerNameFieldButton = UIButton(type: .custom)
        brokerNameFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        brokerNameField.rightView = brokerNameFieldButton
        brokerNameField.rightViewMode = .always

        let countryFieldButton = UIButton(type: .custom)
        countryFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        maharastraField.rightView = countryFieldButton
        maharastraField.rightViewMode = .always
        
        let stateFieldButton = UIButton(type: .custom)
        stateFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        stateField.rightView = stateFieldButton
        stateField.rightViewMode = .always
        
        let cityFieldButton = UIButton(type: .custom)
        cityFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        cityField.rightView = cityFieldButton
        cityField.rightViewMode = .always
        
        let pinCodeFieldButton = UIButton(type: .custom)
        pinCodeFieldButton.setImage(UIImage(named: "pullDown_btn"), for: .normal)
        
        pinCodeField.rightView = pinCodeFieldButton
        pinCodeField.rightViewMode = .always
        
        
        
    }
}
class FirmContactFieldCell: UICollectionViewCell{
    
  
    
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



class PurchaseDealerAccountViewController: UIViewController {
    
    private let firmCellreuseIdentifier = "Cell1"
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
extension PurchaseDealerAccountViewController: UICollectionViewDataSource,UICollectionViewDelegate{
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      
      return 2
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
      return 1
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      switch indexPath.section {
     
          
      case 0:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firmCellreuseIdentifier, for: indexPath) as! FirmFieldCell
          
          return cell
          
      default:
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contactCellreuseIdentifier, for: indexPath) as! FirmContactFieldCell
          
          return cell
          
      }
      
  }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            var title = ""
            switch indexPath.section {
            case 0:
            title = "Firm Details"
            case 1:
                title = "Contacts"
            case 2:
                title = "Bank Details"
         
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
    

extension PurchaseDealerAccountViewController {
        
        func createLayout() -> UICollectionViewLayout {
            
        func firmSection() -> NSCollectionLayoutSection {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let cellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(180))
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
                                                          heightDimension: .estimated(150))
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

