//
//  Comment.swift
//  Idolit
//
//  Created by Mohamed Osman on 16.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation

struct Comment: Encodable, Decodable, Identifiable {
    var id = UUID()
    var comment: String
    var avatarUrl : String
    var ownerId: String
    var postId: String
    var username: String
    var date: Double

}
