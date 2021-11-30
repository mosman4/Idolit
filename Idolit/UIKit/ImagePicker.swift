//
//  ImagePicker.swift
//  Idolit
//
//  Created by Mohamed Osman on 23.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit
import PhotosUI
import MobileCoreServices
import FirebaseStorage


  struct ImagePicker: UIViewControllerRepresentable {



    @Binding var showvideoPicker: Bool
    @Binding var videoDataUrl: URL?

      class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        
        var parentVideoPicker: ImagePicker
          
        
        init( videopicker: ImagePicker) {
            self.parentVideoPicker = videopicker
          }
        
        func uploadVideoToDB(url: URL){
            let filename = UUID().uuidString
                       
                        let ref = Storage.storage().reference().child(filename)
                        
                        do {
                                    let videoData = try Data(contentsOf: url)
                                    ref.putData(videoData)
                                } catch {
                                    print(error)
                                }
        }


          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {


            if let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL {
                parentVideoPicker.videoDataUrl = videoUrl as URL
                print("Looooooooooooooooook",videoUrl)
                // The function to upload videos to storage
                //uploadVideoToDB(url: videoUrl as URL)
            }
            parentVideoPicker.showvideoPicker = false
        }

          func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parentVideoPicker.showvideoPicker = false
          }

      }

    func makeCoordinator() -> Coordinator {
        
        return Coordinator( videopicker: self)
      }

      func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
          let picker = UIImagePickerController()
          picker.mediaTypes = [kUTTypeMovie as String]
          picker.delegate = context.coordinator
          return picker
      }

      func updateUIViewController(_ uiViewController: UIImagePickerController,
                                  context: UIViewControllerRepresentableContext<ImagePicker>) {
      }
  }

  fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
      return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
  }

  fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
      return input.rawValue
  }
  
// The function to upload videos to storage
//uploadVideoToDB(url: videoUrl as URL)
  
  
//@Binding var url: URL?
//@Binding var urlString: String
  
  
  
  
  
  
//                    if let storageUrl = metadata?.downloadURL()?.absoluteString {
//                        print(storageUrl)
//                    }
              

  /*
                          guard let mediaType = info[.mediaType] as? String,
                              mediaType == (kUTTypeMovie as String),
                              let uiURL = info[.mediaURL] as? URL
                              
                              else { return }
            let urlStringpath = uiURL.path // String
            
                          urlString = urlStringpath
                          url = uiURL
                          isShown = false
        */
