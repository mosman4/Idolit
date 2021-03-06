//
//  UserProfileView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var user: User
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State var selection: Selection = .city
   

    
// This is the users view to your profile
    
    var body: some View {
        return
            
                ScrollView(showsIndicators: false) {
                   VStack(alignment: .leading, spacing: 15) {
                    ProfileHeader(user: user, postCount: profileViewModel.posts.count, followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                    
                    // Username and Bio
                    //ProfileInformation(user: user)
                    
                    
                    //follow and Message buttons
                    HStack(spacing: 5) {
                        FollowButton(user: user, isFollowing: $profileViewModel.isFollowing, followingCount: $profileViewModel.followingCountState, followersCount: $profileViewModel.followersCountState)
                        MessageButton()
                    }.padding(.leading, 20).padding(.trailing, 20)
                         
                    
                    // Posts view selection (only logic)
                         Picker(selection: $selection, label: Text("Grid or Table")) {
                                    ForEach(Selection.allCases) { selection in
                                        selection.image.tag(selection)
                                                
                                    }
                         }.pickerStyle(SegmentedPickerStyle()).padding(.leading, 20).padding(.trailing, 20)
                    if !profileViewModel.isLoading {
                                  if selection == .city {
                                      GridPosts(splitted: self.profileViewModel.splitted)
                                  } else {
                                      ForEach(self.profileViewModel.posts, id: \.postId) { post in
                                          VStack {
                    // Change here
                                              HeaderCell(post: post)
                                              FooterCell(post: post)
                                          }
                                      }
                                     
                                  }
                      
                    }
                       
                }.padding(.top, 20)
                                 
                }.navigationBarTitle(Text(self.user.username), displayMode: .inline).onAppear {
                    self.profileViewModel.loadUserPosts(userId: self.user.uid)
                }
      
        
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}

struct FollowButton: View {

    @ObservedObject var followViewModel = FollowViewModel()

    var user: User
    @Binding var following_Count: Int
    @Binding var followers_Count: Int
    @Binding var isFollowing: Bool

    init(user: User, isFollowing: Binding<Bool>, followingCount: Binding<Int>, followersCount: Binding<Int>) {
        self.user = user
        self._following_Count = followingCount
        self._followers_Count = followersCount
        self._isFollowing = isFollowing
    //    updateFollowCount()
       // checkFollowState()
        
 
       

//        self.followersCount = followViewModel.followersCount
//        self.followingCount =  followViewModel.followingCount
    }
    
//    func checkFollowState() {
//        followViewModel.checkFollow(userId: self.user.uid)
//    }
    
    
//    func updateFollowCount() {
//        followViewModel.updateFollowCount(userId: user.uid, followingCount_onSuccess: { (following_Count) in
//            self.following_Count = following_Count
//        }) { (followers_Count) in
//            self.followers_Count = followers_Count
//        }
//    }
//

    func follow() {
        if !self.isFollowing {
            followViewModel.follow(userId: user.uid,  followingCount_onSuccess: { (followingCount) in
                       self.following_Count = followingCount
       }) { (followersCount) in
           self.followers_Count = followersCount
            }
            self.isFollowing = true

        } else {
            followViewModel.unfollow(userId: user.uid,  followingCount_onSuccess: { (followingCount) in
                             self.following_Count = followingCount
             }) { (followersCount) in
                 self.followers_Count = followersCount
                  }
            self.isFollowing = false
        }

    }
    
    var body: some View {
        Button(action: follow) {
            HStack {
                Spacer()
                Text((self.isFollowing) ? "UnFollow" : "Follow").fontWeight(.bold).foregroundColor(Color.white)
                Spacer()
            }.frame(height: 30).background(Color.blue)
            
        }.cornerRadius(5)
    }
}
struct MessageButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Message").fontWeight(.bold).foregroundColor(Color.black)
                Spacer()
                
            }.frame(height: 30).background(Color.white)
            
        }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5), lineWidth: 1))
    }
}
