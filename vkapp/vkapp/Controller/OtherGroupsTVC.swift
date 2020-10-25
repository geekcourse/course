//
//  SearchGroupsTVC.swift
//  vkapp
//
//  Created by gorby on 20.10.2020.
//  Copyright © 2020 gorby. All rights reserved.
//

import UIKit

class SearchGroupsTVC: UITableViewController {
    let groups : [String] = [
        "Group1",
        "Group2",
        "Group3",
        "Group4",
        "Group5"
    ]
    
    //MARK: Lifecycle


    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell
        let group = groups[indexPath.row]
        cell.groupTitleLabel.text = group
        
        return cell
        
    }
}
