//
//  ProfileInformationView.swift
//  Idolit
//
//  Created by Mohamed Osman on 13.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct ProfileInformation: View {
    
    //Bio
    var body: some View {
      
            
        VStack (alignment: .center, spacing: 10) {
                
            Text("About:").font(.headline).padding(.trailing,320)
            Text("Hi, I am Mo, I grew up playing in chilli weather and now I am chill some rridfm fvosd dfosfoksd ewfjwefow dsdojfsdfkosdfdsm dcosdkjfwe efsdojsd fdsojdsccoj dsdfsjos dsdcsm scdsc csdcsdcm dcsdcs cxcx dkf hb jds sdfsdf vdv dvsdv dvd vsd d dsd dcsd dcs sdc dsc dvs gfb. ").fixedSize(horizontal: false, vertical: true).font(.subheadline).padding().frame(height: 160).background(Color.black).cornerRadius(12).shadow(color: .gray,radius: 5).padding(.trailing,10).padding(.leading,10)
                   
                }
       
    }
}

