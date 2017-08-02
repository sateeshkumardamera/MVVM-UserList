//
//  UserViewModel.swift
//  UserList
//
//  Created by user128664 on 8/1/17.
//  Copyright © 2017 Sateesh. All rights reserved.
//

import UIKit

class UserModel {
    
    var name : String?
    var email : String?
    
     init(userDictionary: Dictionary<String, Any>) {
     
        if let username = userDictionary["username"] as? String {
            
            self.name = username
        }
        
        if let email = userDictionary["email"] as? String {
            
            self.email = email
        }
     }
    
}

//viewModel starts
class UserViewModel: NSObject {

    var users = [UserModel]()
    
    var apiClient = APIWrapper()

    func numberOfUsersToDisplay(in section: Int) -> Int {
        return users.count 
    }
    
    func userNameToDisplay(for indexPath: IndexPath) -> String {
        return users[indexPath.row].name ?? ""
    }
    
    func userEmailToDisplay(for indexPath: IndexPath) -> String {
        return users[indexPath.row].email ?? ""
    }

    func getUserModels(completion: @escaping () -> Void)  {
        let url = "https://jsonplaceholder.typicode.com/users"
        apiClient.getResponseFromServer(url) { [unowned self] (success, output) in
        
            if (success) {
                if let response = output as? [DICTIONARY_STRING_ANYOBJECT] {
                
                    for each in response {
                        let user = UserModel(userDictionary: each)
                        self.users.append(user)
                    }
                }
            } else {
                
            }
            completion()
        }

    }
    
    
    
}
