//
//  MovieListViewModel.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import Foundation

class MovieListViewModel {
    var refreshData = { () -> () in }
    typealias PageInfo = (currentPage: Int, totalPages: Int)
    
    var pageInfo: PageInfo = (currentPage: -1, totalPages: 0)
    var movieArray: [Movie] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getMoreInfo(page: Int) {
        if page < pageInfo.totalPages {
            getMovieList(page: page)
        }
    }
    
    func getMovieList(page: Int? = nil) {
        Service.shared.getMovieList(page: page) { result, error in
            if let error = error {
                print("::: Fetch Movies Error \(error)")
            }
            if let list = result?.results {
                self.movieArray += list
                let currentPages = result?.page ?? 0
                let totalPages = result?.total_pages ?? 0
                self.pageInfo = (currentPage: currentPages, totalPages: totalPages)
            }
        }
    }
    
    func movieViewModel(at index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movieArray[index])
    }
}
