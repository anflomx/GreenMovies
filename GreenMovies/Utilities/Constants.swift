//
//  Constants.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import Foundation

struct EndPoint {
    static let moviesList = "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1"
    static let header = InfoPlistParser.getStringValue(key: "API_KEY")
}
