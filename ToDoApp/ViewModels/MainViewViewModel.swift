//
//  MainViewViewModel.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    
    // weak self to not retain cycle that leaks memory
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
