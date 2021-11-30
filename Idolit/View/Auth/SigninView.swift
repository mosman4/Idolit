//
//  ContentView.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct SigninView: View {
    @ObservedObject var signinViewModel = SignInViewModel()
    
    func signIn () {
        
        signinViewModel.signin(email: signinViewModel.email, password: signinViewModel.password, completed: { (user) in
            print(user.email)
            self.clean()
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signinViewModel.showAlert = true
            self.signinViewModel.errorString = errorMessage
            self.clean()
        }
       
    }
    // Cleaning up the fields
    func clean() {
        
        //self.signinViewModel.email = ""
        self.signinViewModel.password = ""
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                //Spacer()
                HeaderView().padding(.bottom,90)

                
                EmailTextField(email: $signinViewModel.email)
                PasswordTextField(password: $signinViewModel.password)
                SignInButton(action: signIn, label: TEXT_SIGN_IN)
               .alert(isPresented: $signinViewModel.showAlert){ Alert(title: Text("Error"), message: Text(self.signinViewModel.errorString), dismissButton: .default(Text("ok")))
                }
                //Divider()
                NavigationLink(destination: SignupView()) {
                 SignupText()
                }
             
                
            }
    // navigation controller bar item color
        }.accentColor(Color.white)
        
        
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}









