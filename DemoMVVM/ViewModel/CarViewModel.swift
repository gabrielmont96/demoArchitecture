//
//  CarViewModel.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import Foundation

protocol CarViewModelDelegate: AnyObject {
    func didFinishRegister()
}

class CarViewModel {
    var cars: [Car] = []
    weak var delegate: CarViewModelDelegate?

    init() {
        initCarList()
    }

    private func initCarList() {
        let cars = [
            Car(model: "Camaro", brand: "Chevrolet"),
            Car(model: "Soul", brand: "Kia"),
            Car(model: "Mustang", brand: "Ford"),
            Car(model: "Camaro", brand: "Chevrolet"),
            Car(model: "Soul", brand: "Kia"),
            Car(model: "Mustang", brand: "Ford")
        ]

        self.cars.append(contentsOf: cars)
    }
    
    func add(car: Car) {
        cars.append(car)
    }
    
    func refreshList() {
        delegate?.didFinishRegister()
    }
}
