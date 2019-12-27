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
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("buttonTapped")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
