//
//  firstappViewController.swift
//  firstapp
//
//  Created by apple on 19/04/22.
//

import UIKit
/*
 
{
    "data": {
        "id": "a541e236-a8fa-4021-af7e-1728a4838a02",
        "name": "GNANASEKARAN",
        "surname": "GNANASEKARAN",
        "email": "Rajan@cognotamedia.fr",
        "community": "Estuaire Sillon",
        "commune": "Boueé",
        "mobile_no": "0640974435",
        "no_of_products": 0,
        "fcm_id": "xyz",
        "os_name": "IOS",
        "otp_verify": 1,
        "CoLocalian_first_login": 2,
        "email_verified_at": null,
        "status": 1,
        "deleted_at": null,
        "created_at": "2021-02-06T12:11:06.000000Z",
        "updated_at": "2022-04-11T20:34:19.000000Z"
    },
    "language": 1,
    "gender": 0,
    "otp": "",
    "CoLocalianId": "COL1493MD",
    "CoLocalianRequest": 2,
    "message": "",
    "role_name": "CoLocal",
    "user_details": {
        "fcm_id": "xyz",
        "os_name": "IOS"
    }
}
  */

struct Login: Codable {
    struct Data: Codable {
        let name: String
        let email: String
    }
    let data: Data
}

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneFiled: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "X-Authorization") != nil {
            performSegue(withIdentifier: "toParkingScreen", sender: nil)
        }
        
        phoneFiled.text = "0640974435"
        passwordField.text = "1234"
    }


@IBAction func loginAction(_ sender: Any) {
    
    guard let mobile = phoneFiled.text, let password = passwordField.text else {
        return print("Fields are mandatory")
    }
    let parameters = [
                "mobile_no": "\(mobile)",
                "password": "\(password)"
            ]

    
    let postData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

        guard let postData = postData else {
            return print("Empty data")
        }
    
    let url = URL(string:"https://systimanx.xyz/gohyper/public/api/v1/login")!

    var urlRequest = URLRequest(url: url)
    urlRequest.httpBody = postData

    urlRequest.httpMethod = "POST"
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard let data = data, let response = response as? HTTPURLResponse else {
            return print("Empty data")
        }

        do {
        
            let login = try? JSONDecoder().decode(Login.self, from: data)

            UserDefaults.standard.set(response.allHeaderFields["X-Authorization"], forKey: "X-Authorization")
            UserDefaults.standard.set(login?.data.name ?? "", forKey: "name")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toParkingScreen", sender: nil)
            }
        }
        
}.resume()
    
}
}


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var surnameField: UITextField!
            
    @IBOutlet weak var nameField: UITextField!
                    
    @IBOutlet weak var emailField: UITextField!
            
    @IBOutlet weak var mobilenumberField: UITextField!
           
    @IBOutlet weak var areaField: UITextField!
            
    @IBOutlet weak var passwordField: UITextField!
            
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surnameField.text = "s"
        
        nameField.text = "karthick"
        
        emailField.text = " karthick123@gmail.com"
        
        mobilenumberField.text = "979867857"
        
        areaField.text = "theni"
        
  
        passwordField.text = "123456"

        
    }
        
    


@IBAction func joinAction(_ sender: Any) {

    guard let surname = surnameField.text,
          let name = nameField.text,
          let email = emailField.text,
          let mobileNumber = mobilenumberField.text,
          let area = areaField.text,
          let password = passwordField.text
        else {
        return print("Fields are mandatory")
    }
    
    let parameters = [
                "surname": "\(surname)",
                "name": "\(name)",
                "email": "\(email)",
                "mobile_no":"\(mobileNumber)",
                "area" :"\(area)",
                "password":"\(password)",
                "community": "test",
                "commune": "test",
                "gender":"male",
                "preferredLanguage":"1"
    ]
        

    
    
    let postData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

        guard let postData = postData else {
            return print("Empty data")
        }
    
    
    let url = URL(string: "https://systimanx.xyz/gohyper/public/api/v1/signup")!
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = postData
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

    
    URLSession.shared.dataTask(with: urlRequest ){ data ,response,error in
        guard let data = data, let response = response as? HTTPURLResponse else {
            return print("Empty data")
        }
        
        guard let login = try? JSONDecoder().decode(Login.self, from: data) else {
            return print(String(data: data, encoding: .utf8))
        }

        UserDefaults.standard.set(response.allHeaderFields["X-Authorization"], forKey: "X-Authorization")
        UserDefaults.standard.set(login.data.name ?? "", forKey: "name")
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toParkingScreen", sender: nil)
        }
    }.resume()
    
    
    
}


}


