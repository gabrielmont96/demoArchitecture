//
//  AppCoordinator.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    var carCoordinator: CarCoordinator?
    var loginCoordinator: LoginCoordinator?
    var isLogged = false
    
    required init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func start() {
        if isLogged {
            showCars()
        } else {
            showLogin()
        }
    }
    
    func showCars() {
        carCoordinator = CarCoordinator(window: window)
        carCoordinator?.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func showLogin() {
        loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator?.delegate = self
        loginCoordinator?.start()
    }
    
    func loginCoordinatorDidFinish(_ loginCoordinator: LoginCoordinator) {
        removeLoginCoordinator()
        showCars()
    }
    
    func loginCoordinatorDidFail(_ loginCoorginador: LoginCoordinator) {
        //do something
        return
    }
    
    func removeLoginCoordinator() {
        loginCoordinator?.stop()
        loginCoordinator = nil
    }
}


