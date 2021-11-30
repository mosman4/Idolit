//
//  Signin+HeaderView.swift
//  Idolit
//
//  Created by Mohamed Osman on 12.07.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Group {
            //Image("logo").resizable().aspectRatio(contentMode:  .fill).frame(width: 80, height: 80)
            
            Text("Idolit").font(Font.title).padding(.top)
            //Text("The easiest way to share photos with family and friends").font(Font.subheadline)
                .foregroundColor(Color.white)
                .multilineTextAlignment(TextAlignment.center)
        }
    }
}
