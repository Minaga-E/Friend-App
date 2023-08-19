//
//  NewFriendView.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 19/08/2023.
//

import SwiftUI

struct NewFriendView: View {
    @State private var friendName = ""
    @State private var friendDescription = ""
    @Binding var sourceArray : [Friend]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form{
            Section("Info") {
                TextField("Name", text: $friendName)
                TextField("Description", text: $friendDescription)
            }
            Section("Actions") {
                Button("Save") {
                    let friend = Friend(name: friendName, description: friendDescription)
                    sourceArray.append(friend)
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView(sourceArray: .constant([]))
    }
}
