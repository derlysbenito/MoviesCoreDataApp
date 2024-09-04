//
//  HomePresenter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import CoreData

class HomePresenter{
    
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    
    private var moviesList = [MovieCoreDataModel]()
}

extension HomePresenter: HomePresenterProtocol{    
    
    //MARK: - Life Cycle
    
    func viewDidLoad() {
        doGetMovies(page: 1)
    }
    
    //MARK: - Navigation
    
    func goToDetailModule(movie: MovieCoreDataModel) {
        router?.navigateToDetailModule(movie: movie)
    }
    
    //MARK: - Data
    
    func doGetMovies(page: Int) {
        interactor?.getMovies(page: page, onCompletion: { [weak self] response in
            switch response.result{
            case .success(let dataInfo):
                if let data = dataInfo.results{
                    print(data)
                    self?.saveMoviesDB(movies: data)
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
    
    func movieItem(section: Int, index: Int) -> MovieCoreDataModel {
        return moviesList[index]
    }
    
    //MARK: - CoreData
    
    private func saveMoviesDB(movies: [ResultsResponse]){
        let context = CoreDataHelper.shared.persistentContainer.viewContext
        
        for movieItem in movies {
            let movieCDM = MovieCoreDataModel(context: context)
            movieCDM.imageMovie = movieItem.imageMovie
            movieCDM.posterPath = movieItem.posterPath
            movieCDM.title = movieItem.title
            movieCDM.rating = movieItem.rating ?? 0
            movieCDM.releaseDate = movieItem.releaseDate
            movieCDM.overview = movieItem.overview
            moviesList.append(movieCDM)
            do {
                try context.save()
            } catch {
                print("Error al guardar en Core Data: \(error.localizedDescription.description)")
            }
        }
    }
    
    private func loadMoviesDB(){
        let context = CoreDataHelper.shared.persistentContainer.viewContext
        
        let request: NSFetchRequest<MovieCoreDataModel> = MovieCoreDataModel.fetchRequest()
        
        do {
            moviesList = try context.fetch(request)
        } catch {
            print("Error al cargar en Core Data: ", error.localizedDescription)
        }
    }
    
    private func deleteMoviesDB(){
        let context = CoreDataHelper.shared.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MovieCoreDataModel.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            print("Error al eliminar en Core Data: ", error.localizedDescription)
        }
    }
    
}
