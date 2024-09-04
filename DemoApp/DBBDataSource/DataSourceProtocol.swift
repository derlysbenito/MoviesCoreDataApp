//
//  DataSourceProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import Foundation

protocol DataSourceProtocol: AnyObject{
    func getMovieUpcoming(page: Int,callbackHandler: @escaping MoviesResultError)
}
