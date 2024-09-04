//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresenterProtocol?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Life Cycle
    
    @IBAction func buttonContinueAction(_ sender: Any) {
        if userTextField.text == "Admin" && passwordTextField.text == "Password*123."{
            presenter?.goToHomeModule()
        } else {
            presenter?.goToAlertController(title: "Error con el usuario")
        }
    }
    
}

extension LoginViewController: LoginViewProtocol{
    
}
