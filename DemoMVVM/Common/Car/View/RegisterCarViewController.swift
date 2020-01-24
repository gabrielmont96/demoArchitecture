//
//  RegisterViewController.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class RegisterCarViewController: UIViewController {
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    
    var viewModel: CarViewModel!
    
    init(viewModel: CarViewModel, nibName: String? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastrar Carros"
    }

    @IBAction func didTapSave(_ sender: Any) {
        let car = Car(model: modelTextField.text ?? "", brand: brandTextField.text ?? "")
        viewModel.addCar(with: car)
    }
}
