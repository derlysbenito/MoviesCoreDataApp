//
//  MainResponse.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

struct MainResponse: Codable{
    let results: [ResultsResponse]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey{
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
