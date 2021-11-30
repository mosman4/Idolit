//
//  MainView.swift
//  Idolit
//
//  Created by Mohamed Osman on 04.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    func logout(){
        session.logout()
        
    }
    
    var body: some View {
        
        TabView {
           //Text(session.userSession == nil)
            
            ProfileView().tabItem({
            Image(systemName: "umbrella"); Text("Crib")
            }).tag(0)
            HomeView().tabItem({
            Image(systemName: "list.bullet.below.rectangle"); Text("Following")
            }).tag(3)
            ChartView().tabItem({
            Image(systemName: "flame"); Text("Lit")
            }).tag(1)
            NotificationView().tabItem({
            Image(systemName: "arrow.up.arrow.down"); Text("Activity")
            }).tag(2)
            CameraView().tabItem({
                Image(systemName: "sparkles"); Text("compete")
            }).tag(4)
            
            
        }.accentColor(.purple).background(Color.white)
        
//        Group {
//            Text((session.userSession == nil) ? "Loading..." : session.userSession!.email)
//            Button(action: logout) {
//                       Text("Log Out")
//            }
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
