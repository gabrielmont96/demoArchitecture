//
//  CarViewModel.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import Foundation

protocol CarViewModelDelegate: AnyObject {
    func carViewModelDidSelectRegister(_ carViewModel: CarViewModel)
    func carViewModelDidSelectRegisterConfirm(_ carViewModel: CarViewModel)
}

protocol CarViewModelViewDelegate: AnyObject {
    func carViewModelViewRefreshList()
}

class CarViewModel {
    
    weak var delegate: CarViewModelDelegate?
    weak var delegateView: CarViewModelViewDelegate?
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
    
    func registerCar() {
        delegate?.carViewModelDidSelectRegister(self)
    }
    
    func addCar(with car: Car) {
        cars.append(car)
        delegateView?.carViewModelViewRefreshList()
        delegate?.carViewModelDidSelectRegisterConfirm(self)
    }
}
