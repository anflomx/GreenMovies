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
}

struct MovieViewModel: MovieType {
    let movie: Movie
    
    var title: NSMutableAttributedString {
        let title = NSMutableAttributedString(string: movie.title ?? "",
                                              attributes: [.font: UIFont(name: Fonts.antonioLight, size: 20)])
        return title
    }
    
    var releaseDate: NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        let date = NSMutableAttributedString(string: movie.release_date ?? "",
                                             attributes: [.font: UIFont(name: Fonts.antonioLight, size: 16)])
        let text = NSMutableAttributedString(string: "Premiered in: ",
                                             attributes: [.font: UIFont(name: Fonts.antonioLight, size: 16)])
        mutableAttributedString.append(text)
        mutableAttributedString.append(date)
        return mutableAttributedString
    }
    
    var url: String {
        let path = movie.poster_path ?? ""
        return EndPoint.baseImageUrl+path
    }
}
