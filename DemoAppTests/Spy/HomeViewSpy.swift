//
//  HomeViewSpy.swift
//  DemoAppTests
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import Foundation
@testable import DemoApp

class HomeViewSpy: HomeViewProtocol{
    
    var presenter: HomePresenterProtocol?
    
    var isReloadCollectionView = false
    
    func reloadCollectionView() {
        isReloadCollectionView = true
    }
    
}
