//
//  DataSourceMock.swift
//  DemoAppTests
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import Foundation
import Alamofire
@testable import DemoApp

class DataSourceMock: DataSourceProtocol{
    func getMovieUpcoming(page: Int, callbackHandler: @escaping MoviesResultError) {
        let jsonData = ResponseSucessMock().movies.data(using: .utf8)
        
        let mainResponse = try! JSONDecoder().decode(MainResponse.self, from: jsonData!)
        let dataResponse = DataResponse<MainResponse, AFError>(
            request: nil,
            response: nil,
            data: nil,
            metrics: nil,
            serializationDuration: 0,
            result: .success(mainResponse)
        )
        callbackHandler(dataResponse)
    }
}
