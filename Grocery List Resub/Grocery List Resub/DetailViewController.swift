//
//  DetailViewController.swift
//  Grocery List Resub
//
//  Created by Jorge Alvarez on 12/27/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount = 0
    var personName = ""
    var personAddress = ""
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else {return}
        personName = name.capitalized
        personAddress = address
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if itemCount == 1 {
            itemCountLabel.text = "You have \(itemCount) item in your grocery list"
        }
        else {
            itemCountLabel.text = "You have \(itemCount) items in your grocery list"
        }
    }

    func showAlert() {
        let alert = UIAlertController(title: "Order Placed!", message: "\(personName), your order will be shipped to \(personAddress) in 15 minutes. Thank You!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: backHandler(alert:)))
        present(alert, animated: true, completion: nil)
    }

    func backHandler(alert: UIAlertAction!) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: DetailDelegate {
    func didAdd(list: [GroceryItem]) {
        let addedItems = list.filter {$0.hasBeenAdded}
        itemCount = addedItems.count
    }
}
