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
    var groceryItem: GroceryItem? // ?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("buttonTapped")
        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else {return}
        personName = name
        personAddress = address
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemCountLabel.text = "You have \(itemCount) item(s) in your grocery list"
    }

    func showAlert() {
        let alert = UIAlertController(title: "Order Placed!", message: "\(personName), your order will be shipped to\n \(personAddress)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: backHandler(alert:)))
        present(alert, animated: true, completion: nil)
    }

    func backHandler(alert: UIAlertAction!) {
        navigationController?.popViewController(animated: true)
    }
}
