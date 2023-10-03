//
//  FriendManager.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 03/10/2023.
//

import Foundation
import SwiftUI

class FriendManager: ObservableObject {
    @Published var friends: [Friend] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "friends.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedFriendData = try? Data(contentsOf: archiveURL),
            let friendsDecoded = try? propertyListDecoder.decode([Friend].self, from: retrievedFriendData) {
            friends = friendsDecoded
        }
    }
}
