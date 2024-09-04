//
//  DetailRouter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

class DetailRouter{
    
    public var coordinator: HomeCoordinator?
    
    required init(coordinator: HomeCoordinator?) {
        self.coordinator = coordinator
    }
}

extension DetailRouter: DetailRouterProtocol{
    func createDetailModule(movie: ResultsResponse?) -> UIViewController {
        guard let vc = mainStoryBoard.instantiateViewController(withIdentifier: "DetailVC")
                as? DetailViewController else { return UIViewController() }
        
        let presenter = DetailPresenter()
        
        presenter.router = self
        presenter.view = vc
        presenter.movie = movie
        
        vc.presenter = presenter
        return vc
    }
    
    
    var mainStoryBoard: UIStoryboard{
        return UIStoryboard(name: "MovieDetail", bundle: Bundle.main)
    }
    
}
