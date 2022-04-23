//
//  ParkingViewController.swift
//  firstapp
//
//  Created by apple on 21/04/22.
//

import UIKit

/*
{
    "result": [
        {
            "Nom_de_loffre_touristique": "AIRE DE SERVICE CAMPING CAR SUPER U SAINT ETIENNE DE MONTLUC",
            "Nom_de_la_commune": "SAINT-ETIENNE-DE-MONTLUC",
            "localisation": "47.2718576,-1.7762979"
        },
    ]}
 */

struct ParkingData: Codable {
    struct Result: Codable {
        let Nom_de_loffre_touristique: String
        let Nom_de_la_commune: String
        let localisation: String
    }
    
    let result: [Result]
}

class ParkingCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

}

class ParkingViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var parkingData: ParkingData?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome " + (UserDefaults.standard.value(forKey: "name") as? String ?? "")

        var urlRequest = URLRequest(url: URL( string: "https://systimanx.xyz/gohyper/public/api/v1/common/touristofferCommune")!)

        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer " + UserDefaults.standard.string(forKey: "X-Authorization")!, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                return print("Empty data")
            }

            do {
                self.parkingData = try? JSONDecoder().decode(ParkingData.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }
            
    }.resume()
    }

}

extension ParkingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return parkingData?.result.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkingCellId", for: indexPath) as! ParkingCell
        let parkingResult = parkingData?.result[indexPath.section]
        cell.nameLabel.text = parkingResult?.Nom_de_loffre_touristique
        cell.descriptionLabel.text = parkingResult?.Nom_de_la_commune

        return cell
    }
    
    
}
