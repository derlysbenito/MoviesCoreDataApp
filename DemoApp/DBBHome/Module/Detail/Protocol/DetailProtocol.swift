//
//  DetailProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

protocol DetailRouterProtocol: AnyObject{
    func createDetailModule(movie: MovieCoreDataModel) -> UIViewController
    
}

protocol DetailPresenterProtocol: AnyObject{
    var router: DetailRouterProtocol? { get set}
    var interactor: DetailInteractorProtocol? { get set}
    var view : DetailViewProtocol? { get set}
    var movie : MovieCoreDataModel? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorProtocol: AnyObject{
    
}

protocol DetailViewProtocol: AnyObject{
    var presenter: DetailPresenterProtocol? { get set}
    
    func displaInfo(movie: MovieCoreDataModel?)
}
