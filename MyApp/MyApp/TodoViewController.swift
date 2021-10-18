//
//  TodoViewController.swift
//  MyApp
//
//  Created by systimanx on 30/09/21.
//

import UIKit

class TodoViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
    }
    
}
extension TodoViewController: UITableViewDelegate {
}
extension TodoViewController: UITableViewDataSource {
    func TableView( TableView:UITableView, numberOfRowsInsection: Int) -> Int {
        
        return 2
        
    }
    func TableView( TableView:UITableView,cellForRowsInSection section: Int) -> UITableViewCell {
         
        let cell = UITableViewsCell()
        cell.textLable?.text = "Hi"
        return cell
    }
}

    
