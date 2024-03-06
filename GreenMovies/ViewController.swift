//
//  ViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Theme.mainBackgroundColor
        self.nameLabel.textColor = Theme.fontGray
        
        Service.shared.getMovieList { result, error in
            guard let list = result?.results else { return }
            for movie in list {
                print("\(movie.title ?? "")")
            }
        }
    }
}
