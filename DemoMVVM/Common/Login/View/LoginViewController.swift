//
//  LoginViewController.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModel!
    
    init(viewModel: LoginViewModel, nibName: String? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonTapped(_ sender: Any) {
        viewModel.doLogin()
    }
}
