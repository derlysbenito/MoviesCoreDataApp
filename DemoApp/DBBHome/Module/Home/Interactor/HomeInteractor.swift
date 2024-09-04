//
//  HomeInteractor.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

class HomeInteractor{
    
    let dataSource : DataSourceProtocol?
    
    required init(dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
    
}

extension HomeInteractor: HomeInteractorProtocol{
    func getMovies(page: Int, onCompletion: @escaping MoviesResultError) {
        print("service page: ", page)
        dataSource?.getMovieUpcoming(page: page, callbackHandler: { response in
            onCompletion(response)
        })
    }
}
