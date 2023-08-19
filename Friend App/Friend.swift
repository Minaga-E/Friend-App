//
//  Friend.swift
//  Friend App
//
//  Created by Minaga Ekanayake on 17/08/2023.
//

import Foundation
import SwiftUI


struct Friend: Identifiable {
    let id = UUID()
    
    var name: String
    var description: String
    var picture: String = "person.crop.circle"
    var color : Color = .blue
}
