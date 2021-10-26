//
//  saveRecordsViewController.swift
//  AudioRecorderApp
//
//  Created by Sivaranjani Venkatesh on 25/10/21.
//

//
// 

import UIKit
import CoreData

class RecordsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView!
    let cellId = "CellId"
    
    let recordList  = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "List of Records"

            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = recordList[indexPath.row]
        return cell
    }
}
    
    


