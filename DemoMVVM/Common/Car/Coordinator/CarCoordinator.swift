//
//  CarCoordinator.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class CarCoordinator: Coordinator {
    
    var window: UIWindow
    var viewModel: CarViewModel!
    var view: UIViewController?
    var navigation: UINavigationController?

    
    required init(window: UIWindow) {
        self.window = window
        self.viewModel = CarViewModel()
        viewModel.delegate = self
    }
    
    func start() {
        self.view = CarViewController(viewModel: viewModel)
        navigation = UINavigationController(rootViewController: view!)
        window.rootViewController = navigation
    }
}

extension CarCoordinator: CarViewModelDelegate {

    func carViewModelDidTapDetail(_ carViewModel: CarViewModel, car: Car) {
        let viewModel = CarDetailViewModel(car)
        view = CarDetailViewController(viewModel: viewModel)
        navigation?.pushViewController(view!, animated: true)
    }

    func carViewModelDidSelectRegister(_ carViewModel: CarViewModel) {
        view = RegisterCarViewController(viewModel: viewModel)
        navigation?.pushViewController(view!, animated: true)
    }
    
    func carViewModelDidSelectRegisterConfirm(_ carViewModel: CarViewModel) {
        navigation?.popViewController(animated: true)
        
    }
    
    
}
