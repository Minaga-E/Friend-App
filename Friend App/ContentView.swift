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
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                Text(friend.name)
            }
            .navigationTitle("Friends")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
