//
//  StorageService.swift
//  Idolit
//
//  Created by Mohamed Osman on 27.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class StorageService {
    static func savePostPhoto(userId: String, caption:String,postId: String, imageData: Data, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        
        // you will need to change here
        
        storagePostRef.putData(imageData, metadata: metadata) { (storageMetadata, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storagePostRef.downloadURL { (url,error) in
                if let metaImageUrl = url?.absoluteString {
                    let firestorePostRef = Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document(postId)
                    let post = Post.init(caption: caption, likes: [:], location: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, avatar: Auth.auth().currentUser!.photoURL!.absoluteString, videodUrl:"LMAO",mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
                    guard let dict = try? post.toDictionary() else {return}
                    
                    firestorePostRef.setData(dict) { (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                        Ref.FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: userId).collection("timelinePosts").document(postId).setData(dict)
                        Ref.FIRESTORE_COLLECTION_ALL_POSTS.document(postId).setData(dict)
                        onSuccess()
                    }
                    
                }
            }
        }
        
        
    }
    static func savePostVideo(userId: String, caption:String,postId: String, videoDataUrl:URL, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void) {
        
        // you will need to change here
        
        do {
            let videoData = try Data(contentsOf: videoDataUrl)
            
            storagePostRef.putData(videoData, metadata: metadata) { (storageMetadata, error) in
                
                if error != nil {
                    onError(error!.localizedDescription)
                    return
                }
                storagePostRef.downloadURL { (url,error) in
                    if let metaImageUrl = url?.absoluteString {
                        let firestorePostRef = Ref.FIRESTORE_MY_POSTS_DOCUMENT_USERID(userId: userId).collection("userPosts").document(postId)
                        let post = Post.init(caption: caption, likes: [:], location: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, avatar: Auth.auth().currentUser!.photoURL!.absoluteString,videodUrl:"LOL", mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: 0)
                        guard let dict = try? post.toDictionary() else {return}
                       
                        firestorePostRef.setData(dict) { (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                            Ref.FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: userId).collection("timelinePosts").document(postId).setData(dict)
                            Ref.FIRESTORE_COLLECTION_ALL_POSTS.document(postId).setData(dict)
                            onSuccess()
                        }
                        
                    }
                }
            }
        } catch{
            
            print(error)
        }
        
        
        
        
    }
    
    static func saveAvatar(userId: String, username:String,email: String, imageData: Data, metadata: StorageMetadata, storageAvatarRef: StorageReference, onSuccess: @escaping(_ user: User)->Void, onError: @escaping(_ errorMessage: String)->Void) {
        
        storageAvatarRef.putData(imageData, metadata: metadata) { (storageMetadata, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storageAvatarRef.downloadURL { (url,error) in
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    
                    
                    
                    
                    let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                    //let userInfor = ["username": self.username, "email": self.email,"profileImageUrl" : metaImageUrl]
                    
                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, bio: "", keywords:username.splitStringToArray())
                    guard let dict = try? user.toDictionary() else {return}
                    
                    //                        guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
                    //                        print(decoderUser.username)
                    
                    firestoreUserId.setData(dict) { (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                        onSuccess(user)
                    }
                    
                }
                
            }
        }
    }
}
