//
//  HomeProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject{
    func createHomeModule() -> UIViewController
    
    func navigateToDetailModule(movie: MovieCoreDataModel)
    func navigateToAlert(message: String)
}

protocol HomePresenterProtocol: AnyObject{
    var router : HomeRouterProtocol? { get set }
    var interactor : HomeInteractorProtocol? { get set }
    var view : HomeViewProtocol? { get set }
    
    func viewDidLoad()
    
    func doGetMovies(page: Int)
    func dogetMoviesSuccess()
    func doGetMoviesError(errorMessage: String)
    
    func numberOfRows() -> Int
    func movieItem(section: Int, index: Int) -> MovieCoreDataModel
    
    func goToDetailModule(movie: MovieCoreDataModel)
    func goToAlert(message: String)
    
}

protocol HomeInteractorProtocol: AnyObject{
    func getMovies(page:Int, onCompletion: @escaping MoviesResultError)
}

protocol HomeViewProtocol: AnyObject{
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadCollectionView()
}

