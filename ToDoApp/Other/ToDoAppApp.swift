//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
