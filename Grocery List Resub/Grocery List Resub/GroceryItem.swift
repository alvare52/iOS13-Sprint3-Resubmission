//
//  GroceryItem.swift
//  Grocery List Resub
//
//  Created by Jorge Alvarez on 12/27/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import Foundation
import UIKit

class GroceryItem: Codable {
    
    var name: String
    var hasBeenAdded: Bool
    var imageName: String
    
    init(name: String, hasBeenAdded: Bool, imageName: String) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
        self.imageName = imageName
    }
}

