//
//  GridPosts.swift
//  Idolit
//
//  Created by Mohamed Osman on 13.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage



struct GridPosts: View {
    
    

    var splitted: [[Post]] = []
    var body: some View {
        VStack (alignment: .leading, spacing: 1){
            //rows
            ForEach(0..<self.splitted.count){ index  in
                HStack(spacing: 1) {
                    //Columns
                    ForEach(self.splitted[index], id: \.postId){post in
                        
                        URLImage(URL(string: post.mediaUrl)!,
                                 // placeholder:Image(systemName: "Circle"),
                            
                            content: {
                                $0.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                                
                        }).frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 3).clipped()
                        
                    }
                }
            }
        }
    }
}
