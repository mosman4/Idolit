//
//  UsernameTextField.swift
//  Idolit
//
//  Created by Mohamed Osman on 20.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct UsernameTextField: View {
   @Binding var username: String
    
    var body: some View {
        HStack {
            
            Image(systemName: "person.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
            
            TextField(TEXT_USERNAME, text: $username)
        }.modifier(TextFieldModifier())
    }
}
