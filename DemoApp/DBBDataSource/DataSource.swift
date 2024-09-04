//
//  DataSource.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import Alamofire

typealias MoviesResultError = (DataResponse<MainResponse, AFError>) -> Void

final class DataSource: DataSourceProtocol{
    
    static let shared = DataSource()
    
    func getMovieUpcoming(page: Int,callbackHandler: @escaping MoviesResultError){
        AF.request("https://api.themoviedb.org/3/movie/upcoming?page=\(page)&api_key=f46b58478f489737ad5a4651a4b25079", method: .get).responseDecodable(of: MainResponse.self) { (response) in
            callbackHandler(response)
        }
    }
    
}
