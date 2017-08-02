//
//  ViewController.swift
//  UserList
//
//  Created by user128664 on 8/1/17.
//  Copyright © 2017 Sateesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func gotoUsersViewController(sender: UIButton) {
        
        let usersVC = self.storyboard?.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        // usersVC.naviTitle = className.uppercased()
        self.navigationController?.pushViewController(usersVC, animated: true)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

