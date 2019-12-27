//
//  GroceryItemController.swift
//  Grocery List Resub
//
//  Created by Jorge Alvarez on 12/27/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import Foundation

class GroceryItemController {
    
    var groceryItems: [GroceryItem] = [GroceryItem(name: "Apple", hasBeenAdded: false, imageName: "apple"),
                                       GroceryItem(name: "Grapes", hasBeenAdded: false, imageName: "grapes"),
                                       GroceryItem(name: "Milk", hasBeenAdded: false, imageName: "milk"),
                                       GroceryItem(name: "Muffin", hasBeenAdded: false, imageName: "muffin"),
                                       GroceryItem(name: "Popcorn", hasBeenAdded: false, imageName: "popcorn"),
                                       GroceryItem(name: "Soda", hasBeenAdded: false, imageName: "soda"),
                                       GroceryItem(name: "Strawberries", hasBeenAdded: false, imageName: "strawberries")
                                       ]
    
    init() {
        loadFromPersistentStore()
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let itemsURL = documentsDir.appendingPathComponent("grocerylistresub.plist")
        return itemsURL
    }
    
    func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let itemsData = try encoder.encode(groceryItems)
            try itemsData.write(to: fileURL)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else {return}
        
        do {
            let itemsData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let itemsArray = try decoder.decode([GroceryItem].self, from: itemsData)
            self.groceryItems = itemsArray
        } catch {
            print("Error loading items from plist: \(error)")
        }
    }

}
