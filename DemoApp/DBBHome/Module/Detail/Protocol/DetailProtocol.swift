//
//  DetailProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

protocol DetailRouterProtocol: AnyObject{
    func createDetailModule(movie: ResultsResponse?) -> UIViewController
    
}

protocol DetailPresenterProtocol: AnyObject{
    var router: DetailRouterProtocol? { get set}
    var interactor: DetailInteractorProtocol? { get set}
    var view : DetailViewProtocol? { get set}
    var movie : ResultsResponse? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorProtocol: AnyObject{
    
}

protocol DetailViewProtocol: AnyObject{
    var presenter: DetailPresenterProtocol? { get set}
    
    func displaInfo(movie: ResultsResponse?)
}
