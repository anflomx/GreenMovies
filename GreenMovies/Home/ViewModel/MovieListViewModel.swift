//
//  MovieListViewModel.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import Foundation

class MovieListViewModel {
    var refreshData = { () -> () in }
    
    var movieArray: [Movie] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getMovieList() {
        Service.shared.getMovieList { result, error in
            if let error = error {
                print("::: Fetch Movies Error \(error)")
            }
            if let list = result?.results {
                self.movieArray = list
            }
        }
    }
    
    func movieViewModel(at index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movieArray[index])
    }
}
