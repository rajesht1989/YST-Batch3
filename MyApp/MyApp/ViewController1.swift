//
//  ViewController1.swift
//  MyApp
//
//  Created by systimanx on 06/10/21.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
    }
    }
extension ViewController1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! movieCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        
        return cell
    }
}
