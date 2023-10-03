//
//  ContentView.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 17/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var friendManager = FriendManager()
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach($friendManager.friends, editActions: [.all]) { $friend in
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
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewFriendView(sourceArray: $friendManager.friends)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
