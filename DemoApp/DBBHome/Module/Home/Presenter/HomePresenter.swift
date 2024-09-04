//
//  HomePresenter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

class HomePresenter{
    
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    
    private var moviesList = [ResultsResponse]()
}

extension HomePresenter: HomePresenterProtocol{
    
    //MARK: - Life Cycle
    
    func viewDidLoad() {
        doGetMovies(page: 1)
    }
    
    //MARK: - Navigation
    
    func goToDetailModule(movie: ResultsResponse?) {
        router?.navigateToDetailModule(movie: movie)
    }
    
    //MARK: - Data
    
    func doGetMovies(page: Int) {
        interactor?.getMovies(page: page, onCompletion: { [weak self] response in
            switch response.result{
            case .success(let dataInfo):
                if let data = dataInfo.results{
                    print(data)
                    self?.moviesList.append(contentsOf: data)
                    self?.dogetMoviesSuccess()
                }
            case .failure(let error):
                print(error.localizedDescription)
                self?.doGetMoviesError()
            }
        })
        
    }
    
    func dogetMoviesSuccess() {
        view?.reloadCollectionView()
    }
    
    func doGetMoviesError() {
        
    }
    
    //MARK: - UICollectionView
    
    func numberOfRows() -> Int {
        return moviesList.count
    }
    
    func movieItem(section: Int, index: Int) -> ResultsResponse {
        return moviesList[index]
    }
    
}
