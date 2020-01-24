//
//  Coordinator.swift
//  DemoMVVM
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 22/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var window: UIWindow { get set }
    
    init(window: UIWindow)
    
    func start()
}
