//
//  HomeView.swift
//  Idolit
//
//  Created by Mohamed Osman on 04.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    // Subscribtion page
    init() {
        self.homeViewModel.loadTimeline()
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Arial", size: 20)!]
    }
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            List{
                    
                    //Text("My Creators").padding(.leading,10).padding(.trailing,190).padding()
                       if !homeViewModel.isLoading {
                            ForEach(self.homeViewModel.posts, id: \.postId) { post in
                                
                  
               
                               
                                if #available(iOS 14.0, *) {
                                    LazyVStack() {
                                        //Text("My Creators")
                                        HeaderCell(post : post)
                                        FooterCell(post: post)
                                    }
                                } else {
                                    // Fallback on earlier versions
                                    VStack() {
                                        //Text("My Creators")
                                        HeaderCell(post : post)
                                        FooterCell(post: post)
                                    }
                                }
                            }
                       }
                   
            }.navigationBarTitle(Text("Subscribtions")).onAppear { self.homeViewModel.loadTimeline()
            
            }
            
        .onDisappear {
                    if self.homeViewModel.listener != nil {
                    self.homeViewModel.listener.remove()
                    }
            }

                   }.navigationViewStyle(StackNavigationViewStyle())
                //}
        
            }
        }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



//public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)

//@inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)
