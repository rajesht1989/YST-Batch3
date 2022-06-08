//
//  StockLedgerViewController.swift
//  Accquipo
//
//  Created by apple on 31/05/22.
//

import UIKit
import Charts

struct StockModel {
    let name: String
    let code: String
    let percentage: String
}

class StockCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}


class StockLedgerViewController: UIViewController, ChartViewDelegate {
    private let reuseIdentifier = "Cell"
    private let supplementaryReuseIdentifier = "supplementaryView"
    private let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    private let titleElementKind = "title-element-kind"
    
    @IBOutlet var chartView: PieChartView!

    @IBOutlet var collectionView: UICollectionView!
    
    let parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
                   "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
                   "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
                   "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
                   "Party Y", "Party Z"]
    
    let data = [[StockModel(name: "Walnut", code: "HSN code 8023100",percentage:"% 18.00")],[StockModel(name: "Lensils Powder ", code: "HSN code 07134000",percentage:"% 1.78")],[StockModel(name: "Dry Dates", code: "HSN code 0841010 ",percentage: "% 18.00")],[StockModel(name: "Cardamom oleoresin", code: "HSN code 33012922",percentage: " % 12.00")],[StockModel(name: "Coriander Powder", code: "HSN code 0862",percentage: "% 8.69")],[StockModel(name: "Walnut", code: "HSN code 8023100",percentage: "% 15.00")],[StockModel(name: "Cardamom oleoresin", code: "HSN code 07134000 ",percentage: " % 3.57")],[StockModel(name: "Lensils Powder", code: "HSN code 0841010",percentage: "% 11.90")]]


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stock Account"
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: titleElementKind, withReuseIdentifier: supplementaryReuseIdentifier)
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
               
        chartView.delegate = self
        
        chartView.holeColor = .clear
        chartView.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.43)
        chartView.holeRadiusPercent = 0.95
        chartView.rotationEnabled = false
        chartView.highlightPerTapEnabled = true
        chartView.drawEntryLabelsEnabled = false

        chartView.maxAngle = 180 // Half chart
        chartView.rotationAngle = 180 // Rotate to make the half on the upper side
        chartView.centerTextOffset = CGPoint(x: 0, y: -20)
        let l = chartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .top
        l.orientation = .horizontal
        l.drawInside = false
        l.xEntrySpace = 10
        l.yEntrySpace = 0
        l.yOffset = 0
//        chartView.legend = l

        // entry label styling
        chartView.entryLabelColor = .white
        
        self.updateChartData()
        
        chartView.animate(xAxisDuration: 0.25, easingOption: .easeOutBack)
    }
    
    func updateChartData() {
        
        self.setDataCount(7, range: 100)
    }

    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count])
        }
        
        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.sliceSpace = 1
        set.selectionShift = 5
        set.colors = [ NSUIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1.0),
                       NSUIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1.0),
                       NSUIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0),
                       NSUIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1.0)]
        set.drawValuesEnabled = false

        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
    
//        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 11)!)
//        data.setValueTextColor(.white)
        
        chartView.data = data
        
        chartView.setNeedsDisplay()
    }
    

}
extension StockLedgerViewController {
    
    func createLayout() -> UICollectionViewLayout {
        
        
        
            let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
             
                if sectionIndex == 0 {
                    
                
                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: titleSize,
                    elementKind: self.titleElementKind,
                    alignment: .top )
                
                section.boundarySupplementaryItems = [titleSupplementary]
                }
              return section
            
            
        }
        return layout
        
    }
    
    
}

extension StockLedgerViewController: UICollectionViewDataSource ,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StockCollectionViewCell
        
        let content = data[indexPath.section][indexPath.item]
        
        cell.nameLabel.text = content.name
        cell.codeLabel.text = content.code
        cell.percentageLabel.text = content.percentage
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                navigationController?.pushViewController(storyboard!.instantiateViewController(withIdentifier: "StockProductDetailsViewController"), animated: true)
            default:break
            }
        default:break
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == titleElementKind {
            let title = "Products"
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryReuseIdentifier, for: indexPath) as! TitleSupplementaryView
            view.label.text = title
            view.label.textColor = .black
            view.label.font = .boldSystemFont(ofSize: 16)
            
            return view
        }
        return UICollectionReusableView()
    }
    

      
    }

