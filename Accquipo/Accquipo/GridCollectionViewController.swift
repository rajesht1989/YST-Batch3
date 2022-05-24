//
//  GridCollectionViewController.swift
//  Accquipo
//
//  Created by apple on 28/04/22.
//

import UIKit
import Charts

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

class GraphCell: UICollectionViewCell {
    @IBOutlet var chartView: LineChartView! {
        didSet {
            chartView.delegate = self
            chartView.chartDescription.enabled = false
            chartView.dragEnabled = true
            chartView.setScaleEnabled(false)
            chartView.pinchZoomEnabled = true
          
//            let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
//            llXAxis.lineWidth = 4
//           // llXAxis.lineDashLengths = [0, 0, 0]
//            llXAxis.labelPosition = .rightBottom
//            llXAxis.valueFont = .systemFont(ofSize: 10)

          //  chartView.xAxis.gridLineDashLengths = [10, 10]
           // chartView.xAxis.gridLineDashPhase = 0

          //  let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
//            let leftAxis = chartView.leftAxis
         //   leftAxis.removeAllLimitLines()
           // leftAxis.addLimitLine(ll1)
            //leftAxis.addLimitLine(ll2)
          //  leftAxis.axisMaximum = 200
           // leftAxis.axisMinimum = -50
            //leftAxis.gridLineDashLengths = [5, 5]
            //leftAxis.drawLimitLinesBehindDataEnabled = true

            chartView.rightAxis.enabled = false

//            [chartView.viewPortHandler setMaximumScaleY: 2.f];
//            [chartView.viewPortHandler setMaximumScaleX: 2.f];

//            let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
//                                       font: .systemFont(ofSize: 12),
//                                       textColor: .white,
//                                       insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
//            marker.chartView = chartView
//            marker.minimumSize = CGSize(width: 80, height: 40)
//            chartView.marker = marker
//
//            chartView.legend.form = .line
//
//            sliderX.value = 45
//            sliderY.value = 100
//            slidersValueChanged(nil)

            chartView.xAxis.drawGridLinesEnabled = false
            chartView.leftAxis.drawGridLinesEnabled = false
            chartView.rightAxis.drawGridLinesEnabled = false
            chartView.animate(yAxisDuration: 0.5)

//            chartView..drawGridLinesEnabled = false
            
        }
        
    }

}

extension GraphCell: ChartViewDelegate {
    
     func updateChartData() {
//        if self.shouldHideData {
//            chartView.data = nil
//            return
//        }

        self.setDataCount(13, range: 200)
    }

    func setDataCount(_ count: Int, range: UInt32) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 1)
            return ChartDataEntry(x: Double(i), y: val, icon: UIImage())
        }

        let set1 = LineChartDataSet(entries: values, label: " ")
        set1.drawIconsEnabled = false
        setup(set1)
        set1.drawValuesEnabled = false
        let value = ChartDataEntry(x: Double(3), y: 3)
        _ = set1.addEntryOrdered(value)
        let gradientColors = [ChartColorTemplates.colorFromString("white").cgColor,
                              ChartColorTemplates.colorFromString("white").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
        set1.fill = LinearGradientFill(gradient: gradient, angle: 90)
        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)

        chartView.data = data
    }

    private func setup(_ dataSet: LineChartDataSet) {
        if dataSet.isDrawLineWithGradientEnabled {
            //dataSet.lineDashLengths = nil
           // dataSet.highlightLineDashLengths = nil
            //dataSet.setColors(.black, .red, .white)
            dataSet.setCircleColor(.black)
           // dataSet.gradientPositions = [0, 40, 100]
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = nil
            dataSet.formLineWidth = 1
           // dataSet.formSize = 15
        } else {
           // dataSet.lineDashLengths = [5, 2.5]
           // dataSet.highlightLineDashLengths = [0, 0.1]
            dataSet.setColor(.blue)
            dataSet.setCircleColor(.blue)
            dataSet.gradientPositions = nil
            dataSet.lineWidth = 0.5
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
           // dataSet.formLineDashLengths = [0, 0.1]
            dataSet.formLineWidth = 0.5
            //dataSet.formSize = 15
        }
    }
}

class GridCollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        collectionView.collectionViewLayout = createLayout()
        navigationController?.setNavigationBarHidden(false, animated: false)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: graphCellreuseIdentifier, for: indexPath) as! GraphCell
            cell.updateChartData()
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
                                                  heightDimension: .absolute(150))
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


