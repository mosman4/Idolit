//
//  CommentInputViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 16.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth


class CommentInputViewModel: ObservableObject {
    
    var post: Post!
    
    func addComments(text: String, onSuccess: @escaping() -> Void) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        guard let username = Auth.auth().currentUser?.displayName else { return }
        guard let avatarUrl = Auth.auth().currentUser?.photoURL?.absoluteString else { return }

        Api.Comment.sendComment(text: text, username: username, avatarUrl: avatarUrl, ownerId: currentUserId, postId: post.postId, onSuccess: {
            if Auth.auth().currentUser!.uid != self.post.ownerId {
                let activityId = Ref.FIRESTORE_COLLECTION_ACTIVITY.document(self.post.ownerId).collection("feedItems").document().documentID
                let activityObject = Activity(activityId: activityId, type: "comment", username: Auth.auth().currentUser!.displayName!, userId: Auth.auth().currentUser!.uid, userAvatar: Auth.auth().currentUser!.photoURL!.absoluteString, postId: self.post.postId,videodUrl:self.post.videodUrl!, mediaUrl: self.post.mediaUrl, comment: text, date: Date().timeIntervalSince1970)
                guard let activityDict = try? activityObject.toDictionary() else { return }

                Ref.FIRESTORE_COLLECTION_ACTIVITY.document(self.post.ownerId).collection("feedItems").document(activityId).setData(activityDict)
            }
            onSuccess()
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
}
