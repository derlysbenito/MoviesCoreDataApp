//
//  ResultsResponse.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

struct ResultsResponse: Codable{
    let imageMovie: String?
    let posterPath: String?
    let title: String?
    let rating: Double?
    let releaseDate: String?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageMovie = "backdrop_path"
        case posterPath = "poster_path"
        case rating = "vote_average"
        case releaseDate = "release_date"
        case overview
    }
}
