//
//  CarViewModel.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import Foundation

class CarViewModel {
    var cars: [Car] = []

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
}
