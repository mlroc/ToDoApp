//
//  ToDoListItemsView.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        .listStyle(PlainListStyle())
                }
                .navigationTitle("To Do List")
                .toolbar {
                    Button {
                        //Action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: 
                                    $viewModel.showingNewItemView)
                })
            }
        }
    }
}
    
    #Preview {
        ToDoListView(userId: "L0sxgsWjcYMrlIxyBI6ffMBaWfa2")
    }
