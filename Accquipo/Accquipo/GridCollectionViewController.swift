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
            chartView.rightAxis.enabled = false
            chartView.xAxis.drawGridLinesEnabled = false
            chartView.leftAxis.drawGridLinesEnabled = false
            chartView.rightAxis.drawGridLinesEnabled = false
            chartView.animate(yAxisDuration: 0.5)
        }
    }
}

extension GraphCell: ChartViewDelegate {
    
     func updateChartData() {


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
            dataSet.setCircleColor(.black)
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = nil
            dataSet.formLineWidth = 1
        } else {
            dataSet.setColor(.blue)
            dataSet.setCircleColor(.blue)
            dataSet.gradientPositions = nil
            dataSet.lineWidth = 0.5
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineWidth = 0.5
        }
    }
}

class GridCollectionViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        collectionView.collectionViewLayout = createLayout()
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HalfScreenViewController") as! HalfScreenViewController
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        present(controller, animated: true) {
            controller.view.backgroundColor = .red
        }
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        
        return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
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

class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: 0, y: (bounds.height / 2) + 20, width: bounds.width, height: bounds.height / 2)
    }
}

