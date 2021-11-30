//
//  SignupViewModel.swift
//  Idolit
//
//  Created by Mohamed Osman on 27.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI
// Observable objects is used to notify changes made on this page to other pages 
class SignupViewModel: ObservableObject {
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var errorString = ""
    var image: Image = Image(IMAGE_USER_PLACEHOLDER)
    var imageData: Data = Data()
    @Published var showAlert: Bool = false
    @Published var showImagePicker: Bool = false
    
    func signup(username: String, email: String, password: String, imageData: Data,completed: @escaping(_ user: User)->Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty && !imageData.isEmpty {
            AuthService.signupUser(username: username, email:email, password: password, imageData: imageData,onSuccess: completed, onError: onError)
        }else{
            showAlert = true
            errorString = "Please fill in all the fields"
        }
        
    }
}
