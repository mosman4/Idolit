//
//  CommentViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 16.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    
        @Published var comments: [Comment] = []
        @Published var isLoading = false
        var postId: String!
        var listener: ListenerRegistration!
        
        func loadComments() {
            self.comments = []
            self.isLoading = true
            
            Api.Comment.getComments(postId: postId, onSuccess: { (comments) in
                if self.comments.isEmpty {
                    self.comments = comments
                }
            }, onError: { (errorMessage) in
                
            }, newComment: { (comment) in
                if !self.comments.isEmpty {
                    self.comments.append(comment)
                }
            }) { (listener) in
                self.listener = listener
            }
            
     
        }
    }

