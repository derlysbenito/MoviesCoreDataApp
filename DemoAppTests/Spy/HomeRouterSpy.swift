//
//  HomeRouterSpy.swift
//  DemoAppTests
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import Foundation
import UIKit
@testable import DemoApp

class HomeRouterSpy: HomeRouterProtocol{
    
    var isNavigateToDetailModule = false
    
    func createHomeModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToDetailModule(movie: DemoApp.MovieCoreDataModel) {
        var isNavigateToDetailModule = true
    }
    
}
