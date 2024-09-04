//
//  CoordinatorProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

public protocol CoordinatorProtocol{
    var presenter : MainPresenterProtocol? { get set }
    func start()
    
}
