//
//  Service.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    let headers = [
      "accept": "application/json",
      "Authorization": "Bearer \(EndPoint.header)"
    ]
    
    func getMovieList(completion: @escaping (MovieList?, Error?) -> ()) {
        guard let url = NSURL(string: EndPoint.moviesList) as? URL else { return }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("::: Request Error \(error)")
                return
            }
            
            guard let json = data else { return }
            do {
                let movieList = try JSONDecoder().decode(MovieList.self, from: json)
                completion(movieList, nil)
            } catch let jsonError {
                print("::: Error decode MovieList \(jsonError)")
            }
        }.resume()
    }
}
