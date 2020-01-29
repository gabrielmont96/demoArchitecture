//
//  RegisterViewController.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class RegisterCarViewController: UIViewController {
    
    var viewModel: CarViewModel?

    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!

    static func instantiate() -> RegisterCarViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterCarViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastrar Carros"
    }

    @IBAction func didTapSave(_ sender: Any) {
        let car = Car(model: modelTextField.text ?? "", brand: brandTextField.text ?? "")
        viewModel?.add(car: car)
        viewModel?.refreshList()
        navigationController?.popViewController(animated: true)
    }
}
