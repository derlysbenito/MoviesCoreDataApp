//
//  MainPresenter.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

public class MainPresenter : UINavigationController{
   
}

extension MainPresenter : MainPresenterProtocol{
    
    public func setupPresenter() {
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
        self.setNavigationBarHidden(true, animated: false)
    }
    
    public func setViewControllers(viewControllers: [UIViewController], animated: Bool) {
        self.setViewControllers(viewControllers, animated: animated)
    }
    
    public func presentViewController(viewController: UIViewController, animate: Bool) {
        self.present(viewController, animated: animate)
    }
    
    public func pushViewController(viewController: UIViewController, animate: Bool) {
        self.pushViewController(viewController, animated: animate)
    }
    
    public func popViewController(animate: Bool) {
        self.popViewController(animated: animate)
    }
    
    public func dismiss(animate: Bool) {
        self.dismiss(animated: animate)
    }
}
