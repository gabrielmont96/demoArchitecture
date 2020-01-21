//
//  ViewController.swift
//  DemoMVVM
//
//  Created by Paulo Ferreira de Jesus - PFR on 20/01/20.
//  Copyright © 2020 Iteris. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var viewModel: CarViewModel = CarViewModel()

    static func instantiate() -> CarViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "CarViewController") as! CarViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "Carros"
        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToRegister))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }

    @objc func navigateToRegister() {
        let viewController = RegisterCarViewController.instantiate()
        viewController.delegate = self

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func reloadData() {
        tableView.reloadData()
    }

}

extension CarViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(viewModel.cars[indexPath.row].model) - \(viewModel.cars[indexPath.row].brand)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.cars.remove(at: indexPath.row)
            reloadData()
        }
    }

}

extension CarViewController: RegisterCarViewControllerDelegate {

    func didFinishRegister() {
        reloadData()
    }

    func add(_ car: Car) {
        viewModel.cars.append(car)
    }
}

