//
//  UsersView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage

struct UsersView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
  
    
    
// This here is the search view 
    var body: some View {
   
        VStack{
            SearchBar(text: $usersViewModel.searchText, onSearchButtonChanged: usersViewModel.searchTextDidChange)
        List {
            if !usersViewModel.isLoading {
                ForEach (usersViewModel.users, id: \.uid){user in
                    NavigationLink(destination: UserProfileView(user: user)){
                HStack {
                    URLImage(URL(string: user.profileImageUrl)!,
                       // placeholder:Image(systemName: "Circle"),
                    
                        content: {
                            $0.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                              
                            
                        }).frame(width: 50, height: 50)
                            
                        VStack(alignment: .leading,spacing: 5) {
                            Text(user.username).font(.headline).bold()
                            Text("IOS developer").font(.subheadline)
                        }
                    
                    
                     }.padding(10)
                }
                  }
            
                }
            }
            }.navigationBarTitle(Text("Search"), displayMode: .inline)
        
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
