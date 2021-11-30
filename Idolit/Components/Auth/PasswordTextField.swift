//
//  PasswordTextField.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    
    var body: some View {
        HStack {

            SecureField("Password", text: $password)
            Image(systemName: "lock.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
        }.modifier(TextFieldModifier())
    }
}
