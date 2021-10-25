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
    
    var people: [NSManagedObject] = []
//    var arrayList :[String] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "The Names List"
        tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: "CellId")
        
        // Do any additional setup after loading the view.
    }
    // we need to fetch the data from DB
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      //1
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      //2
      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Sounds")
      
      //3
      do {
        people = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
    
    //Action for the add button
    @IBAction func buttonTapped(_ sender: Any) {
    
    
        let alert = UIAlertController(title: "New Record", message: "Add a New record", preferredStyle: .alert)
        let saveAction = UIAlertAction(title:"Save", style: .default){
            [unowned self] action in
                                              
                guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                    return
                }
                
                self.save(name: nameToSave)
                self.tableView.reloadData()
              
        }
        
//        let cancelAction = UIAlertAction(title: "Cancel",
//                                         style: .cancel)
//
        alert.addTextField()
        
        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
        
        present(alert, animated: true)
      }
   
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //step :1
        //first we need create container
        let managedContext = appDelegate.persistentContainer.viewContext
        //step:2
        //entity name seems like person names (person table)
        let entity = NSEntityDescription.entity(forEntityName: "Sounds", in: managedContext)!
        //step:3
        //store the value into the table(we have used the insert query for store some data into the table)
        let person = NSManagedObject(entity:entity, insertInto: managedContext)
        person.setValue(name, forKeyPath: "sounds")
        //step 4:
        //retrive the data from DB
        do {
            //we need to save the data into container
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("could  not save")
                
            }
            
        }

        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = person.value(forKeyPath: "sounds") as? String
        return cell
        
    }
    

}
