//
//  Photopicker.swift
//  Idolit
//
//  Created by Mohamed Osman on 03.10.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI
import MobileCoreServices
import AVFoundation
import FirebaseStorage

struct Photopicker: UIViewControllerRepresentable {
    @Binding var showImagePicker: Bool
    @Binding var pickedImage: Image
    @Binding var imageData: Data
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<Photopicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        // Use this to upload both videos and photos
       // imagePicker.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]

        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Photopicker>) {
        return
    }
    
    func makeCoordinator() -> Photopicker.Coordinator {
        Coordinator(imagePicker: self)
        

    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parentImagePicker: Photopicker


        init( imagePicker: Photopicker) {
        self.parentImagePicker = imagePicker
        }


 
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
                        
                    
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as!
            UIImage
            parentImagePicker.pickedImage = Image(uiImage: uiImage)
            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
                parentImagePicker.imageData = mediaData
                print("Looooooooooooooooooooook",parentImagePicker.imageData)
            }
            parentImagePicker.showImagePicker = false
        
        }
            

        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parentImagePicker.showImagePicker = false
        }
        
    }
}



//@Binding var url: URL?

// use this to upload videos photos at the same time
//imagePicker.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]

//        return Coordinator( showImagePicker: $showImagePicker, url: $url)

//        @Binding var url: URL?
//        @Binding var showImagePicker: Bool
//        var parentImagePicker: Photopicker

//        init( showImagePicker: Binding<Bool>, url: Binding<URL?>) {
//            _showImagePicker = showImagePicker
//            _url = url
//
//        }

//DataService.instance.uploadVideoToDB(url: url! as URL)
