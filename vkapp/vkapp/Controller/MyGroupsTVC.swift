//
//  GrouplistVC.swift
//  vkapp
//
//  Created by gorby on 18.10.2020.
//  Copyright © 2020 gorby. All rights reserved.
//

import UIKit

class GrouplistTVC: UITableViewController {
    var groups: [String] = []

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


    //MARK: Actions

    @IBAction func searchTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SearchGroupsTVC")
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GroupCVC, let indexPath = tableView.indexPathForSelectedRow {
            controller.group = groups[indexPath.row]
        }
    }

    @IBAction func unwindFromSearchGroups(_ sender: UIStoryboardSegue) {
        guard
                let controller = sender.source as? SearchGroupsTVC,
                let indexPath = controller.tableView.indexPathForSelectedRow else {
            return
        }

        let group = controller.groups[indexPath.row]

        if !groups.contains(group) {
            groups.append(group)
            tableView.reloadData()
        }
        return
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
