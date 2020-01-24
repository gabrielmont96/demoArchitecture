//
//  LoginViewModel.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func loginViewModelDidFinish(_ loginViewModel: LoginViewModel)
    func loginViewModelDidFail(_ loginViewModel: LoginViewModel)
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    func doLogin() {
        delegate?.loginViewModelDidFinish(self)
    }
}
