//
//  NotificationView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
                    
                    Text("Under maintenance  ...").bold()
                    
                   
                
            

            }.navigationBarTitle(Text("Activity"), displayMode: .inline)
        

    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
