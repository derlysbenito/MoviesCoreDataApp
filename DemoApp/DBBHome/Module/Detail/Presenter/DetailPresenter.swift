//
//  DetailPresenter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

class DetailPresenter{
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    weak var view: DetailViewProtocol?
    var movie: MovieCoreDataModel?
}

extension DetailPresenter: DetailPresenterProtocol{
    
    func viewDidLoad() {
        view?.displaInfo(movie: self.movie)
    }
    
}
