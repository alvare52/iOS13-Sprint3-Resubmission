//
//  GroceryItemCollectionViewCell.swift
//  Grocery List Resub
//
//  Created by Jorge Alvarez on 12/27/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var groceryItem: GroceryItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = groceryItem else {return}
        nameLabel.text = item.name
        imageView.image = UIImage(named: item.imageName)
        if item.hasBeenAdded {
            hasBeenAddedLabel.text = "Added"
        }
        else {
            hasBeenAddedLabel.text = "Not Added"
        }
    }
    
}

extension GroceryItemCollectionViewCell: ItemSelectionDelegate {
    func didTapItem(item: GroceryItem) {
        item.hasBeenAdded.toggle()
    }
}
