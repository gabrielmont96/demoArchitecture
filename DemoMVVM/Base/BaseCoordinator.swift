//
//  BaseCoordinator.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

protocol BaseCoordinator: AnyObject {
    
    var view: UIViewController? { get set }
    
    var navigation: UINavigationController? { get set }
    
    func start() -> UIViewController
}
