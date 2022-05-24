//
//  ViewController.swift
//  Accquipo
//
//  Created by apple on 23/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var googlButton : UIButton!
      
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Logout"

        /*
        googlButton.setTitle("", for: .normal)
            let googleImage = UIImage(named: "google")
        googlButton.setImage(googleImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        facebookButton.setTitle("", for: .normal)
            let facebookImage = UIImage(named: "facebook")
        facebookButton.setImage(facebookImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    */
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    }



