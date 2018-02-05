//
//  TvShowsTableViewController.swift
//  Focus Engine Starter
//
//  Created by Marcos Morais on 05/02/2018.
//  Copyright © 2018 Marcos Morais. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    let productReusableCellIdentifier = "ProductCell"
    
    let products = ["Community", "Game of Thrones", "The Walking Dead", "Atlanta", "Westworld", "Red Dead Redemption 2", "Assassin's Creed Origins"]
    let productsDescriptions = ["TV Show", "TV Show", "TV Show", "TV Show", "TV Show", "Game", "Game"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Os produtos mais comentados"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productReusableCellIdentifier, for: indexPath)
        
        cell.textLabel!.text = products[indexPath.row]
        cell.detailTextLabel?.text = productsDescriptions[indexPath.row]
        
        return cell
    }
    
    // MARK: Focus Engine
    
    /**
     Método que determina quais serão os indexPaths que podem receber foco.
     */
    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        let canBeFocused = indexPath.row == 3 ? false : true
        return canBeFocused
    }
    
    /**
     Método que determina qual indexPath receberá o foco do momento de renderização da TableView.
     */
    override func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return IndexPath(row: 4, section: 0)
    }

}
