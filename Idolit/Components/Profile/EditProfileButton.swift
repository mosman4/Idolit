//
//  EditProfileButton.swift
//  Idolit
//
//  Created by Mohamed Osman on 13.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI


struct EditProfileButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Edit").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 30).background(Color.black)
            
        }.cornerRadius(60).padding(.leading, 290).padding(.trailing, 10).padding(.top,290)
    }
}

