//
//  ToDoListItemViewViewModel.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// Viewmodel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }

    
}
