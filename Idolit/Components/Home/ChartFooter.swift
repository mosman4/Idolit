//
//  ChartFooter.swift
//  Idolit
//
//  Created by Mohamed Osman on 10.09.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage

struct ChartFooter: View {

  
  @ObservedObject var footerCellViewModel = FooterCellViewModel()
  
  init(post: Post) {
      
      self.footerCellViewModel.post = post
      self.footerCellViewModel.checkPostIsLiked()
  }
  
 
  var body: some View {
    
      VStack(alignment: .leading, spacing: 9) {
                  
        
                  // Caption
                  Text(self.footerCellViewModel.post.caption).fixedSize(horizontal: false, vertical: true).font(.callout).foregroundColor(.white)
        
                  // Username
                  Text("by \(self.footerCellViewModel.post.username)").fixedSize(horizontal: false, vertical: true).font(.caption).foregroundColor(.gray)
                  
                  
                  
              
                  
                 
             
              
              
          }.frame(width: 200, height: 50, alignment: .topLeading)

        }
   
   }
