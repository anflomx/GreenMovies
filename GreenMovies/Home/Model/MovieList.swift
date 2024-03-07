//
//  MovieList.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import Foundation

struct MovieList: Decodable {
    var page: Int?
    var results: [Movie]
    var total_pages: Int?
}
