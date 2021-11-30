//
//  CameraViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI
import ProgressHUD

class CameraViewModel: ObservableObject {

    // For videos
    var image2: Image = Image (systemName: IMAGE_PHOTO)
    @Published var videoDataUrl: URL?
    @Published var showvideoPicker: Bool = false
    // For photos
    var image: Image = Image (systemName: IMAGE_PHOTO)
    var imageData: Data = Data()
    @Published var showImagePicker: Bool = false
    // For both
    var caption: String = ""
    @Published var showAlert: Bool = false
   // @Published var url: URL?
    var errorString = ""
    
    func sharePost( completed: @escaping()->Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !caption.isEmpty && !imageData.isEmpty {
            print("skrrr skrrr")
            
            // also changed here
        Api.Post.uploadPost(caption: caption,imageData: imageData, onSuccess: completed, onError: onError)
            //ProgressHUD.dismiss()
            
        }else if !caption.isEmpty && videoDataUrl != nil{
            print("Bla Bla Bla")
            // notice that videoDataUrl is Force-unwrapped
            Api.Post.uploadVideo(caption: caption,videoDataUrl:videoDataUrl!, onSuccess: completed,onError: onError)
            
          }else {
            showAlert = true
            errorString = "Please fill in all fields"
            
          }

    }
}

