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
    
    func navigateToDetailModule(movie: ResultsResponse?)
}

protocol HomePresenterProtocol: AnyObject{
    var router : HomeRouterProtocol? { get set }
    var interactor : HomeInteractorProtocol? { get set }
    var view : HomeViewProtocol? { get set }
    
    func viewDidLoad()
    
    func doGetMovies(page: Int)
    func dogetMoviesSuccess()
    func doGetMoviesError()
    
    func numberOfRows() -> Int
    func movieItem(section: Int, index: Int) -> ResultsResponse
    
    func goToDetailModule(movie: ResultsResponse?)
    
}

protocol HomeInteractorProtocol: AnyObject{
    func getMovies(page:Int, onCompletion: @escaping MoviesResultError)
}

protocol HomeViewProtocol: AnyObject{
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadCollectionView()
}

