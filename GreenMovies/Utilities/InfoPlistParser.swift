//
//  InfoPlistParser.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import Foundation

struct InfoPlistParser {
    static func getStringValue(key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            print("::: Error InfoPlist Value \(key)")
            return ""
        }
        return value
    }
}
