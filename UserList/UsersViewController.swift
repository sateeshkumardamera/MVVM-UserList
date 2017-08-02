//
//  UsersViewController.swift
//  UserList
//
//  Created by user128664 on 8/1/17.
//  Copyright © 2017 Sateesh. All rights reserved.
//

import UIKit
typealias DICTIONARY_STRING_ANYOBJECT = [String: Any]

class UsersViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var viewModel = UserViewModel()

    @IBOutlet weak var tableViewUsers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUserModels() {
            self.tableViewUsers.reloadData()
        }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfUsersToDisplay(in: section)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath)
        cell.textLabel?.text = viewModel.userNameToDisplay(for: indexPath)
        cell.detailTextLabel?.text = viewModel.userEmailToDisplay(for: indexPath)
        
        return cell
    }
    
  
}
