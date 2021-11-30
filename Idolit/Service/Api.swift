//
//  Api.swift
//  Idolit
//
//  Created by Mohamed Osman on 11.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation

// Api.Post.getPost()  Api.User.searchUsers()
class Api {
    static var User = UserApi()
    static var Post = PostApi()
    static var Comment = CommentApi()
    static var Activity = ActivityApi()
}
