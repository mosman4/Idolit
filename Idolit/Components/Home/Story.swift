//
//  Story.swift
//  Idolit
//
//  Created by Mohamed Osman on 05.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI


struct Story: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 22) {
                ForEach(1..<10) { _ in
                    VStack {
                        
                        Image("photo1").resizable().clipShape(Circle())
                            .aspectRatio(contentMode: ContentMode.fill).frame(width: 50, height: 50).overlay(Circle().inset(by: -2.5).stroke()).shadow(radius: 3)
                        Text("Story").font(.caption)
                    }
                }
            }.padding(.top, 10).padding(.leading, 5)
            Image("add").position(x: 50, y: -40)
        }.frame( height: 90)
    }
}

