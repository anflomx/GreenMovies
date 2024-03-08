//
//  MovieViewModel.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import Foundation
import UIKit

protocol MovieType {
    var title: NSMutableAttributedString { get }
    var releaseDate: NSMutableAttributedString { get }
    var url: String { get }
    var description: NSMutableAttributedString { get }
    var rating: NSMutableAttributedString { get }
}

struct MovieViewModel: MovieType {
    let movie: Movie
    
    var title: NSMutableAttributedString {
        let title = NSMutableAttributedString(string: movie.title ?? "",
                                              attributes: [.font: UIFont(name: Fonts.antonioLight, size: 20) ?? UIFont()])
        return title
    }
    
    var releaseDate: NSMutableAttributedString {
        let date = NSMutableAttributedString(string: "Premiered in: \(movie.release_date ?? "")",
                                             attributes: [.font: UIFont(name: Fonts.antonioLight, size: 16) ?? UIFont()])
        return date
    }
    
    var url: String {
        let path = movie.poster_path ?? ""
        return EndPoint.baseImageUrl+path
    }
    
    var description: NSMutableAttributedString {
        let desc = NSMutableAttributedString(string: movie.overview ?? "",
                                             attributes: [.font: UIFont(name: Fonts.antonioLight, size: 18) ?? UIFont()])
        return desc
    }
    
    var rating: NSMutableAttributedString {
        let str = String(format: "%.1f", movie.vote_average ?? 0)
        let rating = NSMutableAttributedString(string: "Rating: \(str) / 10",
                                               attributes: [.font: UIFont(name: Fonts.antonioLight, size: 18) ?? UIFont()])
        return rating
    }
}
