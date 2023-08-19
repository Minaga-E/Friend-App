//
//  FriendDetailView.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 17/08/2023.
//

import SwiftUI

struct FriendDetailView: View {
    @Binding var friend : Friend
    
    @State var profile = ["person.crop.circle", "brain.head.profile", "figure.walk", "soccerball"]
    
    
    var body: some View {
        List{
            Picker("**Picture**", selection: $friend.picture) {
                ForEach(profile, id: \.self) {
                    Image(systemName: $0)
                        .foregroundColor(friend.color)
                }
            }
            TextField("Name", text: $friend.name)
            TextField("Description", text: $friend.description)
                .foregroundColor(.gray)
            ColorPicker("Color", selection: $friend.color)
        }
        .navigationTitle("Friend Details")
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(Friend(name: "Akala", description: "He likes Blue")))
    }
}
