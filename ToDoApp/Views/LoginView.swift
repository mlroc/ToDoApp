//
//  LoginView.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do App",
                           subtitle: "The #1 App To Get Stuff Done",
                           angle: 15,
                           background: .pink)
                    
                // Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", 
                             background: .blue
                    ) {
                        //Attempt to log in
                        viewModel.login()
                    }

                }
                
                
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}
