//
//  Constants.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import Foundation
import UIKit

struct EndPoint {
    static let moviesList = "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page="
    static let header = InfoPlistParser.getStringValue(key: "API_KEY")
    static let baseImageUrl = "https://image.tmdb.org/t/p/original"
}

struct Fonts {
    static let antonioLight = "Antonio-Light"
}

struct Colors {
    static let background900 = "Background900"
    static let background800 = "Background800"
    static let background700 = "Background700"
    static let background600 = "Background600"
    static let background500 = "Background500"
    static let background400 = "Background400"
    static let background300 = "Background300"
    static let background200 = "Background200"
    static let background100 = "Background100"
    static let background0 = "Background0"
    static let green = "Green"
    static let gray = "Gray"
    static let white = "White"
    static let alert = "Alerts"
}
