//
//  TableViewController.swift
//  Accquipo
//
//  Created by apple on 25/04/22.
//

import UIKit
 class TableViewController: UIViewController {

     @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCellId", for: indexPath)
        cell.textLabel?.text = "abc"
        return cell
    }

    
    
}
//class TableViewController: UIViewController {
//   
//    
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
//    
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    
//    }
//
//}
//
//extension TableViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCellId", for: indexPath)
//        cell.textLabel?.text = "abc"
//        return cell
//    }
//    
//
//    
//}

