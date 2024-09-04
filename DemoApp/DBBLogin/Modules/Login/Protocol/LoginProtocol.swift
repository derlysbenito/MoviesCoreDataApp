//
//  LoginProtocol.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject{
    func createLoginModule() -> UIViewController
    
    func navigateToHomeModule()
    func navigateToAlertController(title: String)
}

protocol LoginPresenterProtocol: AnyObject{
    var router: LoginRouterProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var view: LoginViewProtocol? { get set }
    
    func goToHomeModule()
    func goToAlertController(title: String)
}

protocol LoginInteractorProtocol: AnyObject{
    
}

protocol LoginViewProtocol: AnyObject{
    var presenter : LoginPresenterProtocol? { get set }
}
