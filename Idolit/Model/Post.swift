//
//  Post.swift
//  Idolit
//
//  Created by Mohamed Osman on 13.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation


struct Post: Encodable, Decodable {
    var caption: String
    var likes: [String: Bool]
    var location: String
    var ownerId: String
    var postId: String
    var username: String
    var avatar: String
    var videodUrl: String?
    var mediaUrl: String
    var date: Double
    var likeCount: Int
    
}
