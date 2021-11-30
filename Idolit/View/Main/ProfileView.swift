//
//  ProfileView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage
import FirebaseAuth

// Your view to your profile

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileViewModel = ProfileViewModel()

    @State var postCountState = 0
    @State var selection: Pselection = .All

    
    var displayState = ["play.rectangle", "speedometer","info.circle"]
       var body: some View {
         return
             NavigationView {
                ScrollView(showsIndicators: false) {
                   
                    VStack(alignment: .center, spacing: 20) {
                        ProfileHeader(user: self.session.userSession, postCount: profileViewModel.posts.count, followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                     
                     // redisign from a button to an image containing vertical three dots
                     //EditProfileButton()
                     // Your user name and Bio
                     //ProfileInformation(user: self.session.userSession)
                          
                        
                     // Posts view selection (only logic)
                          Picker(selection: $selection, label: Text("")) {
                             ForEach(Pselection.allCases) { selection in
                                 selection.image.tag(selection)
                                         
                             }
                          }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 90).padding(.trailing, 90)
                        
                        if !profileViewModel.isLoading {
                            
                            if selection == .All {
                            
                                ForEach(self.profileViewModel.posts, id: \.postId) { post in
                                  
                          
                                        VStack(spacing: 15) {
                                        
                                            // Change here
                                            HeaderCell(post: post)
                                            FooterCell(post: post)
                                        }
                                    
                                   
                                }
                            
                            } else if selection == .Top {
                                ForEach(self.profileViewModel.posts, id: \.postId) { post in
                                   
                                        
                                        VStack(spacing: 15) {
                                            
                                            // Change here
                                            HeaderCell(post: post)
                                            FooterCell(post: post)
                                        }
                                    
                                    
                                }
                        
                            }else{
                                VStack(alignment: .center,spacing: 30){
                                                     ProfileInformation()
                                                     Contact()

                                }
                                
                                
                            }
                         
                    
                        }
                    }
                    
                     }.edgesIgnoringSafeArea(.all).navigationBarTitle(Text("")).navigationBarItems(leading:
                         Button(action: {}) {
                             NavigationLink(destination: UsersView()) {
                                 Image(systemName: "magnifyingglass").imageScale(Image.Scale.large).foregroundColor(.purple)
                             }
                         },trailing:
                        
                         Button(action: {
                             self.session.logout()
                             
                         }) {
                            VStack{
                             Image(systemName: "arrow.right.circle.fill").imageScale(Image.Scale.large).foregroundColor(.purple)
                                
                            }
                            
                     } ).onAppear {
                         self.profileViewModel.loadUserPosts(userId: Auth.auth().currentUser!.uid)
                     }
                 
             }
            
       
         
     }

}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
