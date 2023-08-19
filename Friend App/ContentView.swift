//
//  ContentView.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 17/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var friends = [
        Friend(name: "Ben", description: "Works in the bakery"),
        Friend(name: "Max", description: "School Friend"),
        Friend(name: "Yoosuf", description: "Best Friend")
    ]
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List{ 
                ForEach($friends, editActions: [.all]) { $friend in
                    NavigationLink {
                        FriendDetailView(friend: $friend)
                    } label: {
                        HStack{
                            Image(systemName: friend.picture)
                                .foregroundColor(friend.color)
                            
                            VStack(alignment: .leading){
                                Text(friend.name)
                                    .foregroundColor(friend.color)
                                Text(friend.description)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                }
                }
                .onDelete { indexSet in
                    friends.remove(atOffsets: indexSet)
                }
                .onMove { originalOffsets, newOffset in friends.move(fromOffsets: originalOffsets,
                toOffset: newOffset)
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
                NewFriendView(sourceArray: $friends)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
