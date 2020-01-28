//
//  CarDetailViewController.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 28/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    var viewModel: CarDetailViewModel!

    init(viewModel: CarDetailViewModel, nibName: String? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes"
        setup()
    }

    func setup() {
        let car = viewModel.car
        modelLabel.text = car.model
        brandLabel.text = car.brand
    }

}
