//
//  Extensions.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/27/24.
//

// TO-DO
// Read about codable
// this is a work around for doin things manually for the User

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return[:]
        }
    }
}
