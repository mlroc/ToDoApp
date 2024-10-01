//
//  TLButton.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/27/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Attempt to log in
            // Action should occur here once button is pressed
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title:"value", 
             background: .pink) {
        // Action
    }
    
}
