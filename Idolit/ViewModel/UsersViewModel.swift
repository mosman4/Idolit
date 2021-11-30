//
//  UsersViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 11.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @ Published var users: [User] = []
    @ Published var isLoading = false
    var searchText : String = ""
    
    func searchTextDidChange() {
        isLoading = true
        //Api.User.SearchUsers(text: searchText)
        Api.User.searchUsers(text: searchText) { (users) in
            self.isLoading = false
            self.users = users
            
            
        }
    }
    
}
