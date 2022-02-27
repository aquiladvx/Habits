//
//  SignInView.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var action: Int? = 0
    
    @State var navigationHidden = true
    
    var body: some View {
        ZStack {
            if case SignInUIState.GO_TO_HOME = viewModel.uiState {
                viewModel.goToHome()
            } else {
                NavigationView {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer(minLength: 36)
                            VStack(alignment: .center, spacing: 8) {
                                logo
                                title
                                emailField
                                passwordField
                                signInButton
                                registerLink
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 16)
                        .navigationBarTitle("Login",
                                            displayMode: .automatic)
                        .navigationBarHidden(navigationHidden)
                        
                        if case SignInUIState.FAILURE(let message) = viewModel.uiState {
                            CustomAlert(content: message)
                        }
                    }
                    .onAppear {
                        self.navigationHidden = true
                    }
                    .onDisappear {
                        self.navigationHidden = false
                    }
                }
            }
        }
    }
}

extension SignInView {
    
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 100)
    }
    
    var title: some View {
        CustomTitle(text: "Login")
            .padding(.bottom, 8)
    }
    
    var emailField: some View {
        CustomTextField(text: "Email", binding: $email, capitalization: .never,errorMessage: "Invalid Email" ,failure: !email.isEmail(),
                        keyboard: .emailAddress)
    }
    
    var passwordField: some View {
        CustomTextField(text: "Password", binding: $password, capitalization: .never, errorMessage: "your password must be at least 8 characters long", failure: password.count < 8, isSecure: true)
            .padding(.bottom, 20)
    }
        
    var signInButton: some View {
        CustomButton(text: "Sign In", showProgress: viewModel.uiState == SignInUIState.LOADING, disabled: !email.isEmail() || password.count < 8) {
            viewModel.login(email: email, password: password)
        }
    }
    
    var registerLink: some View {
        VStack {
            Text("New around here?")
                .foregroundColor(Color.gray)
                .padding(.top, 48)
            
            ZStack {
                NavigationLink(
                    destination: viewModel.goToSignUp(),
                    tag: 1,
                    selection: $action,
                    label: {
                        EmptyView()
                    })
                
                Button("Sign up") {
                    self.action = 1
                }
            }
            
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        ForEach(ColorScheme.allCases, id: \.self) { value in
            SignInView(viewModel: viewModel)
                .preferredColorScheme(value)
        }
    }
}
