//
//  PostPopularViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 14.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI

class PostPopularViewModel: ObservableObject {
    @ Published var posts: [Post] = []
    @ Published var isLoading = false
    var splitted : [[Post]] = []
    func loadPostsPopular () {
        isLoading = true
        Api.Post.loadPosts() { (posts) in
            self.isLoading = false
            self.posts = posts
            //self.splitted = self.posts.splited(into: 3)
        }
    }
}



// instead of user ID use the location key from the API  //func loadUserPosts(userId: String) {
