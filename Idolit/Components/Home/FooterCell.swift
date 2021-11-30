//
//  FooterCell.swift
//  Idolit
//
//  Created by Mohamed Osman on 05.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage
import UIKit

struct FooterCell: View {
    
    @ObservedObject var footerCellViewModel = FooterCellViewModel()
    
    init(post: Post) {
        
        self.footerCellViewModel.post = post
        self.footerCellViewModel.checkPostIsLiked()
    }
    
   
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .center, spacing: 15) {
                
                //profile photo
                
                 VStack(alignment: .trailing) {
                    
                    URLImage(URL(string: self.footerCellViewModel.post.avatar)!,
                                                            content: {
                                                               $0.image
                                                                
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fill)
                                                                
                                                                   
                    
                    
                                                   }).frame(width: 50, height: 50).clipShape(RoundedRectangle(cornerRadius:20,
                        style: .continuous)).shadow(color: .purple, radius: 5)
                }
                    
                VStack(alignment: .leading,spacing: 5) {
                    
                    // Username
                    Text(self.footerCellViewModel.post.username).fixedSize(horizontal: false, vertical: true).font(.callout).foregroundColor(.white)
                    
                    // caption
                    Text(self.footerCellViewModel.post.caption).fixedSize(horizontal: false, vertical: true).font(.caption)
                    
                    
                }.frame(width: 250, height: 50, alignment: .topLeading)
                    
                    VStack{
                    VStack(alignment: .leading, spacing: 15){
                    
                        
                        
                // Arrow up
                Image(systemName: (self.footerCellViewModel.isLiked) ? "arrow.up" : "arrow.up.to.line.alt").imageScale(Image.Scale.large).onTapGesture {
                    if self.footerCellViewModel.isLiked {
                        self.footerCellViewModel.unlike()
                        
                    }else{
                        self.footerCellViewModel.like()
                    }
                    }
                        
                // comments
                NavigationLink(destination: CommentView(post: self.footerCellViewModel.post)) {
                    Image(systemName: "text.append").foregroundColor(.white)//.renderingMode(.original)

                }
                
            
                
                
                }.padding(.top,30).padding(.bottom)
                
                Spacer()
                
                
                //Image(systemName: "heart.slash")
               

                }
            }
            
  
//         Text(timeAgoSinceDate(Date(timeIntervalSince1970:self.footerCellViewModel.post.date), currentDate: Date(), numericDates: true)).font(.caption).foregroundColor(.gray).padding(.leading,140)
//
                
                
                
            }//.frame(width: 360,height: 80).background(Color.black).cornerRadius(12).shadow(color: .white,radius: 1).padding(.bottom,40)
            
            // time of the post
            
            
            //Image(systemName: "rectangle.3.offgrid").padding(.leading,173).padding()

            
        }
    
    }


//            if footerCellViewModel.post.likeCount > 0  {
//                Text("\(footerCellViewModel.post.likeCount)\(self.footerCellViewModel.post.likeCount > 1 ? " likes" : " like")").font(.caption).foregroundColor(.gray).padding(.leading, 15).padding(.top, 5)
//
//            }
            
            
          
//            NavigationLink(destination: CommentView(post: self.footerCellViewModel.post)) {
//                Text("View all comments").font(.caption).foregroundColor(.gray).padding(.leading, 15)
//            }
            
//            HStack {
//                URLImage(URL(string: self.footerCellViewModel.post.avatar)!,
//
//                                        content: {
//                                           $0.image
//                                               .resizable()
//                                               .aspectRatio(contentMode: .fill)
//                                               .clipShape(Circle())
//
//
//                               }).frame(width: 25, height: 25)
//
//            }.padding(.trailing, 15).padding(.leading, 15)


