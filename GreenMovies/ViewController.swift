//
//  ViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = Service()
        service.getMovieList { result, error in
            guard let list = result?.results else { return }
            for movie in list {
                print("\(movie.title ?? "")")
            }
        }
    }
}
