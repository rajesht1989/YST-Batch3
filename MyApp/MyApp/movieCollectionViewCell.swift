//
//  movieCollectionViewCell.swift
//  MyApp
//
//  Created by systimanx on 05/10/21.
//

import UIKit

class movieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var moviImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    func setup(with movie: movie) {
        
        titleLbl.text = movie.title
    }
    }
