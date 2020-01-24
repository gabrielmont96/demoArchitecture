//
//  LoginCoordinator.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func loginCoordinatorDidFinish(_ loginCoordinator: LoginCoordinator)
    func loginCoordinatorDidFail(_ loginCoorginador: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    var window: UIWindow
    var viewModel: LoginViewModel!
    
    weak var delegate: LoginCoordinatorDelegate?
    
    required init(window: UIWindow) {
        self.window = window
        viewModel = LoginViewModel()
        viewModel.delegate = self
    }
    
    func start() {
        let view = LoginViewController(viewModel: viewModel)
        window.rootViewController = view
    }
    
    func stop() {
        viewModel = nil
        delegate = nil
    }
}

extension LoginCoordinator: LoginViewModelDelegate {
    func loginViewModelDidFinish(_ loginViewModel: LoginViewModel) {
        delegate?.loginCoordinatorDidFinish(self)
    }
    
    func loginViewModelDidFail(_ loginViewModel: LoginViewModel) {
        return
    }
    
    
}
