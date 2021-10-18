//
//  user1ViewController.swift
//  MyApp
//
//  Created by systimanx on 12/10/21.
//

import UIKit

class user1ViewController: UIViewController {

    @IBOutlet weak var myLableText: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UserDefaults.standard.string(forKey: "userName")
        if value != nil
        {
            myLableText.text="Hello, \(value!)"
            myLableText.layer.borderWidth = 2
            myLableText.layer.borderColor = UIColor.red.cgColor
        }

    }

    @IBAction func saveButtonpressed(_ sender: Any) {
        UserDefaults.standard.set(myTextField.text!, forKey: "username")
        let alert = UIAlertController(title: "saving", message: "data saved in userDefaults successfully", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default) { (action) in
        }
            print("data has been saved")
            alert.addAction(okButton)
        
            present(alert,animated: true,completion: nil)
            myTextField.text = ""
        }
    }

