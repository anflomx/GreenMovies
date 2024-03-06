//
//  Movie.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import Foundation

struct Movie: Decodable {
    var id: Int?
    var poster_path: String?
    var title: String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
}
