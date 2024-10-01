//
//  User.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}