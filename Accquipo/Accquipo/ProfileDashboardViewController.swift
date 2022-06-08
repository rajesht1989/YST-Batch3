//
//  ProfileDashboardViewController.swift
//  Accquipo
//
//  Created by apple on 01/06/22.
//

import UIKit
import Charts
class MonthCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var monthLabel: UILabel!
}

class ProfileDashboardViewController: UIViewController,ChartViewDelegate{
    
    private let reuseIdentifier = "Cell"
    
    @IBOutlet var collectionView: UICollectionView!
    
    let data = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

    
    
    @IBOutlet var chartView: BarChartView!
    
    @IBOutlet var profitView: UIView!
    @IBOutlet var purchaseView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
        
        self.title = "Bar Chart"
        purchaseView.clipsToBounds = true
        purchaseView.layer.cornerRadius = 10

        
        profitView.clipsToBounds = true
        profitView.layer.cornerRadius = 10
        chartView.clipsToBounds = true
        chartView.layer.cornerRadius = 10
        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        chartView.backgroundColor = .white
        chartView.maxVisibleCount = 20
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
//        chartView.leftAxis.drawGridLinesEnabled = false
//        chartView.rightAxis.drawGridLinesEnabled = false

    
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
     
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        leftAxisFormatter.negativeSuffix = " K"
        leftAxisFormatter.positiveSuffix = " K"
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.labelCount = 8
        rightAxis.valueFormatter = leftAxis.valueFormatter
        rightAxis.spaceTop = 0.15
        rightAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
//        chartView.legend = l

        self.updateChartData()

      
  
    }
    
    func updateChartData() {
     
        self.setDataCount(3, range: UInt32(70))
    }
    

    func setDataCount(_ count: Int, range: UInt32) {
        let start = 1
        
        var yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult))
            
            return BarChartDataEntry(x: i % 2 == 0 ? Double(i) - 0.8 : Double(i), y: val)
        }
        
        let yVals1 = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult))
            
            return BarChartDataEntry(x: i % 2 != 0 ? Double(i) - 0.8 : Double(i), y: val)
        }
        
        yVals.append(contentsOf: yVals1)
        
        var set1: BarChartDataSet! = nil
        if let set = chartView.data?.first as? BarChartDataSet {
            set1 = set
            set1.replaceEntries(yVals)
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
        } else {
            set1 = BarChartDataSet(entries: yVals, label: "")
            set1.colors = liberty()// ChartColorTemplates.material()
            set1.drawValuesEnabled = false
            
            let data = BarChartData(dataSet: set1)
            //data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
            data.barWidth = 0.1
            chartView.data = data
        }
        
        func liberty () -> [NSUIColor]
        {
            return [
                NSUIColor(red: 83/255.0, green: 123/255.0, blue: 255/255.0, alpha: 1.0),
                NSUIColor(red: 59/255.0, green: 73/255.0, blue: 174/255.0, alpha: 1.0),
            ]
        }

    }
    
    }

extension ProfileDashboardViewController {
    
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 12)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
//        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
     
 let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ProfileDashboardViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MonthCollectionViewCell
        
        cell.monthLabel.text = data[indexPath.item]

        
        
    return cell


}
}
