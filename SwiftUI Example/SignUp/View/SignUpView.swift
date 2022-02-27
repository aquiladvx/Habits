//
//  SignUpView.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-27.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var fullName = ""
    @ObservedObject var phone = NumbersOnly()
    @State var email = ""
    @State var password = ""
    @State var birthday = ""
    
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 8) {
                        title

                        fullNameField

                        phoneField
                        
                        emailField
                        
                        passwordField
                        
                        birthdayField
                        
                        Spacer()
                        
                        saveButton
                    }
                }
            }
            
            if case SignUpUIState.FAILURE(let value) = viewModel.uiState {
                 CustomAlert(content: value)
            }
        }.padding(.horizontal, 16)
    }
}


extension SignUpView {
    
    var title: some View {
        CustomTitle(text:"Register")
            .padding(.bottom, 32)
    }


    var fullNameField: some View {
        CustomTextField(text: "Full name", binding: $fullName, capitalization: .words)
    }

    var phoneField: some View {
        CustomTextField(text: "Phone", binding: $phone.value, keyboard: .decimalPad)
    }
    
    var emailField: some View {
        CustomTextField(text: "Email", binding: $email, capitalization: .never)
    }
    
    var passwordField: some View {
        CustomTextField(text: "Password", binding: $password, capitalization: .never)
    }
    
    var birthdayField: some View {
        CustomTextField(text: "Birthday", binding: $birthday, capitalization: .never)
    }
    
    var saveButton: some View {
        CustomButton(text: "Save") {
            viewModel.signUp()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
    }
}
