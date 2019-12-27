//
//  GroceryItemCollectionViewController.swift
//  Grocery List Resub
//
//  Created by Jorge Alvarez on 12/27/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

// segue called ShowDetailSegue

protocol ItemSelectionDelegate {
    func didTapItem(item: GroceryItem)
}

protocol DetailDelegate {
    func didAdd(list: [GroceryItem])
}

class GroceryItemCollectionViewController: UICollectionViewController {
    
    let groceryItemController = GroceryItemController()
    var itemSelectionDelegate: ItemSelectionDelegate?
    var detailDelegate: DetailDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // ?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = groceryItemController.groceryItems[indexPath.item]
        itemSelectionDelegate?.didTapItem(item: selectedCell)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            guard let detailVC = segue.destination as? DetailViewController else {return}
            detailDelegate = detailVC
            detailDelegate?.didAdd(list: groceryItemController.groceryItems)
        }
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return groceryItemController.groceryItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItemCell", for: indexPath) as? GroceryItemCollectionViewCell else {return UICollectionViewCell()}
        
        let item = groceryItemController.groceryItems[indexPath.item]
        cell.groceryItem = item
        itemSelectionDelegate = cell
    
        // Configure the cell
    
        return cell
    }


}
