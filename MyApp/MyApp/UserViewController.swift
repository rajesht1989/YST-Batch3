

import UIKit

class UserViewController: UIViewController {
    

    @IBOutlet weak var myLabelText: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UserDefaults.standard.string(forKey: "username")
        if value != nil
        {
            myLabelText.text="Hello, \(value!)"
        }
        
        
    }
    
    
    @IBAction func saveButtonpressed(_ sender: Any) {
    
    
        UserDefaults.standard.set(myTextField.text!, forKey: "username")
        let alert = UIAlertController(title: "saveing", message: "data saved in userDefaults successfully", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default) { (action) in
            print("data hasben saved")
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        myTextField.text = ""
    }
    
}
