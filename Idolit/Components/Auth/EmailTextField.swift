//
//  EmailTextField.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        HStack {
            
            
            
            TextField("Email", text: $email)
        }.modifier(TextFieldModifier())
    }
}
