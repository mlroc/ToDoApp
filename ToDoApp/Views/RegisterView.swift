//
//  RegisterView.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        //Header
        HeaderView(title: "Register",
                   subtitle: "Start organizing!",
                   angle: -15,
                   background: .orange)
        
        Form {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Create Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(
                title: "Create Account",
                    background: .green
            ) {
                //Attempt registration
                viewModel.register()
            }
            .padding()
            
        }
        .offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
