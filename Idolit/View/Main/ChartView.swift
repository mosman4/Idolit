//
//  SearchView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    var photo = ""
    
}

// Did you know that onAppear method reloads data everytime the page is tapped ?
struct ChartView: View {
init() {
    
    self.postPopularViewModel.loadPostsPopular()
    
    }
    @ObservedObject var postPopularViewModel = PostPopularViewModel()
    @State var selection: Selection = .city
    var body: some View {
        return
            NavigationView {
                ScrollView(showsIndicators: false) {
                    
                    Picker(selection: $selection, label: Text("Grid or Table")) {
                        ForEach(Selection.allCases) { selection in selection.image.tag(selection)

                        }
                    }.pickerStyle(SegmentedPickerStyle()).padding()
                    
                    if !postPopularViewModel.isLoading {
                        
                        if selection == .city {
                            //GridPosts(splitted: self.postPopularViewModel.splitted)
                      
//                            ForEach(Array(self.postPopularViewModel.posts.enumerated()), id: \.1.postId) { (index, post) in
                            ForEach(Array(zip(self.postPopularViewModel.posts.indices, self.postPopularViewModel.posts)), id: \.1.postId) { index, post in
                            //ForEach (Array(1...30), id: \.self) { index in
                                
                                
                                                           HStack(alignment: .top, spacing: 25) {
                                                               ChartHeader(post : post)
                                                               ChartFooter(post: post)
                                                           Text("#\(index + 1)").frame(width: 45, height: 30)
                                                               
                                                               
                                                           }.frame(width: 370, height: 70)//.background(Color.black).cornerRadius(5).shadow(color: .red,radius: 3)
                                
                                                           
                                                       }
                            
                        }else{
                           
                            ForEach(self.postPopularViewModel.posts, id: \.postId) { post in
                                
                                HStack(alignment: .top, spacing: 25) {
                                    ChartHeader(post : post)
                                    ChartFooter(post: post)
                                Text("#").frame(width: 45, height: 30)
                                    
                                    
                                }.frame(width: 330, height: 70)
                                
                                
                            }
                            
                        }
                    }
                    
                    
                    
                    
                }.navigationBarTitle(Text("Chart"), displayMode: .inline)//.onAppear{
//
//                  self.postPopularViewModel.loadPostsPopular()
//                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
