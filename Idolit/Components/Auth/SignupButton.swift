//
//  SignupButton.swift
//  Idolit
//
//  Created by Mohamed Osman on 20.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct SignupButton: View {
    var action: () -> Void
    var label: String
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(label).fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
                
            }
            
        }.modifier(SigninButtonModifier())
    }
}
