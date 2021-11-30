 //
//  InitialView.swift
//  Idolit
//
//  Created by Mohamed Osman on 04.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct InitialView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func listen() {
        session.listenAuthenticationState()
      
        
    }
    
    var body: some View {
        Group {
            if session.isLoggedIn {
                MainView()
            }else{
                SigninView()
                
            }
        }.onAppear(perform: listen)
    }
}
