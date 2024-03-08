//
//  MovieViewModel.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import Foundation
import UIKit

protocol MovieType {
    var titleCel: NSMutableAttributedString { get }
    var releaseDateCel: NSMutableAttributedString { get }
    
    var title: NSMutableAttributedString { get }
    var releaseDate: NSMutableAttributedString { get }
    var url: String { get }
    var description: NSMutableAttributedString { get }
    var rating: NSMutableAttributedString { get }
}

struct MovieViewModel: MovieType {
    let movie: Movie
    let attributesTitleCel: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: Fonts.antonioLight, size: 20) ?? UIFont(),
        .foregroundColor: Theme.fontGreen ?? UIColor.black,
    ]
    let attributesdreleaseDateCel: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: Fonts.antonioLight, size: 20) ?? UIFont(),
        .foregroundColor: UIColor.gray,
    ]
    let attributesDetail: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: Fonts.antonioLight, size: 20) ?? UIFont(),
        .foregroundColor: UIColor.white,
    ]
    
    var titleCel: NSMutableAttributedString {
        let title = NSMutableAttributedString(
            string: movie.title ?? "",
            attributes: attributesTitleCel)
        return title
    }
    
    var releaseDateCel: NSMutableAttributedString {
        let date = NSMutableAttributedString(
            string: "Premiered in: \(movie.release_date ?? "")",
            attributes: attributesdreleaseDateCel)
        return date
    }
    
    var title: NSMutableAttributedString {
        let title = NSMutableAttributedString(
            string: movie.title ?? "",
            attributes: attributesDetail)
        return title
    }
    
    var releaseDate: NSMutableAttributedString {
        let date = NSMutableAttributedString(
            string: "Premiered in: \(movie.release_date ?? "")",
            attributes: attributesDetail)
        return date
    }
    
    var url: String {
        let path = movie.poster_path ?? ""
        return EndPoint.baseImageUrl+path
    }
    
    var description: NSMutableAttributedString {
        let desc = NSMutableAttributedString(
            string: movie.overview ?? "",
            attributes: attributesDetail)
        return desc
    }
    
    var rating: NSMutableAttributedString {
        let str = String(format: "%.1f", movie.vote_average ?? 0)
        let rating = NSMutableAttributedString(
            string: "Rating: \(str) / 10",
            attributes: attributesDetail)
        return rating
    }
}
