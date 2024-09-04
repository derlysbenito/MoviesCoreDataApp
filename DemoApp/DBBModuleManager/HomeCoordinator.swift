//
//  HomeCoordinator.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

class HomeCoordinator: HomeCoordinatorProtocol{
    
    var presenter: MainPresenterProtocol?
    
    required init(presenter: MainPresenterProtocol?) {
        self.presenter = presenter
    }
    
    func start() {
        
    }
    
    func presentHomeModule() {
        let router = HomeRouter(coordinator: self)
        let vc = router.createHomeModule()
        presenter?.setViewControllers(viewControllers: [vc], animated: false)
    }
}
