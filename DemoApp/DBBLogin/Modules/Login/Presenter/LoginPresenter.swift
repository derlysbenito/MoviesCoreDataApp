//
//  LoginPresenter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation

class LoginPresenter{
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?
    weak var view: LoginViewProtocol?
}

extension LoginPresenter: LoginPresenterProtocol{
    
    func goToHomeModule() {
        router?.navigateToHomeModule()
    }
    
    func goToAlertController(title: String) {
        router?.navigateToAlertController(title: title)
    }
    
}
