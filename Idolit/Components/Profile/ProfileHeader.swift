//
//  ProfileHeader.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage
struct ProfileHeader: View {
    var user: User?
    var postCount: Int
    @Binding var followingCount: Int
    @Binding var followersCount: Int
    
//These are the header profile details including the pp and the counters
    var body: some View {
        
        

                
                
                    
        ZStack(alignment: .leading){
                    if user != nil {
                    // profile Image
                    URLImage(URL(string: user!.profileImageUrl)!,
                    content: {
                        $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: UIScreen.main.bounds.size.width, height: 340).clipped()

                    })
                    Spacer()
                    .frame(width:65 ,height: 170)
                        .background(Color.black).blur(radius: 50).cornerRadius(20).padding(.top,50)
                    
                    VStack{
                        //impact
                        VStack {
                            Text("5987").font(.callout).bold()
                            Text("Impact").font(.subheadline).italic()
                        }.padding(10).foregroundColor(.white)
                        //media
                        VStack {
                            Text("\(postCount)").font(.callout).bold()
                            Text("Media").font(.subheadline).italic()
                        }.padding(10).foregroundColor(.white)
                       // Fans
                        VStack {
                            Text("\(followersCount)").font(.callout).bold()
                            Text("Fans").font(.subheadline).italic()
                        }.padding(10).foregroundColor(.white)
                        
                    
                        
                        
                        
                    }.padding(.top,50)
                        
                        //username
                        if user != nil {
                        Text(user!.username).bold().font(.title).fixedSize(horizontal: true, vertical: false).padding(.top,280).foregroundColor(.white)
                        }
                        EditProfileButton()
                }
            }
        
    }
}








//                // Counters
//                    Spacer()
//                    //media
//                    VStack {
//                        Text("\(postCount)").font(.headline)
//                        Text("Posts").font(.subheadline)
//                    }.padding(10)
//                // Fans
//                    VStack {
//                        Text("\(followersCount)").font(.headline)
//                        Text("Followers").font(.subheadline)
//                    }.padding(10)
//                // Following
//                    VStack {
//                        Text("\(followingCount)").font(.headline)
//                        Text("Following").font(.subheadline)
//                    }.padding(10)
//                    Spacer()
