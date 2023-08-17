//
//  Friend.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 17/08/2023.
//

import Foundation

enum Social {
    case new, old, school, work
}

struct Friend: Identifiable {
    let id = UUID()
    
    var name: String
    var description: String
    var picture: String = "person.crop.circle"
    var type : Social = .new
}
