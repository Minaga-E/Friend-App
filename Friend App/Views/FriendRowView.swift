//
//  FriendRowView.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 19/08/2023.
//

import SwiftUI

struct FriendRowView: View {
    @Binding var friend: Friend

    
    var body: some View {
        NavigationLink {
            FriendDetailView(friend: $friend)
        } label: {
            HStack{
                Image(systemName: friend.picture)
                    
                
                VStack(alignment: .leading){
                    Text(friend.name)
                        
                    Text(friend.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
            }
        }
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRowView(friend: .constant(Friend(name: "Testing", description: "Testing")))
    }
}
