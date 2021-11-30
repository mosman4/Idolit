//
//  Contact.swift
//  Idolit
//
//  Created by Mohamed Osman on 20.09.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct Contact: View {
    
// Insta,facebook,twitter
    var body: some View {
        
        HStack(alignment: .center, spacing: 30){
            
            Image("instagram logo").resizable().clipShape(RoundedRectangle(cornerRadius:10,
            style: .continuous))
                .frame(width: 55, height: 55)
                .shadow(color: .gray,radius: 4)
            Image("facebook logo").resizable().clipShape(RoundedRectangle(cornerRadius:10,
            style: .continuous))
                .frame(width: 55, height: 55)
                .shadow(color: .gray,radius: 4)
            Image("twitter logo").resizable().clipShape(RoundedRectangle(cornerRadius:10,
            style: .continuous))
                .frame(width: 55, height: 55)
                .shadow(color: .gray,radius: 4)
            
            
            
        }.frame(width:250, height:75).background(Color.black).cornerRadius(15).shadow(color: .gray,radius: 10)


  }
}
