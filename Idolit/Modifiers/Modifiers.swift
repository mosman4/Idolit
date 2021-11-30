//
//  Modifiers.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding().border(Color.gray,width: 2).cornerRadius(6).padding([.leading, .trailing, .top])
        
    
    }
    
}

struct SigninButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding().background(Color.purple).cornerRadius(5).shadow(radius: 10, x: 0, y: 10).padding()
}
}
