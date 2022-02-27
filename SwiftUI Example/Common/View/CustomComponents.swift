//
//  Components.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

struct CustomTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .font(Font.system(.title).bold())
    }
}

struct CustomTextField: View {
    var text: String
    @Binding var binding: String
    var capitalization: TextInputAutocapitalization? = nil
    var errorMessage: String? = nil
    var failure: Bool? = nil
    var keyboard: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(text, text: $binding)
                    .font(.title3)
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color("TextColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .frame(maxWidth: .infinity)
                    .background(Color("BackgroundColor"))
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
            } else {
                TextField(text, text: $binding)
                    .font(.title3)
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color("TextColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .frame(maxWidth: .infinity)
                    .background(Color("BackgroundColor"))
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
            }
            if let error = errorMessage, failure == true, !binding.isEmpty {
                Text(error)
                    .foregroundColor(.red)
            }
        }
    }
}

struct CustomPasswordField: View {
    var text: String
    var binding: Binding<String>
    
    var body: some View {
        SecureField(text, text: binding)
            .font(.title3)
            .padding()
            .textInputAutocapitalization(.never)
            .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color("TextColor"), style: StrokeStyle(lineWidth: 2.0)))
            .frame(maxWidth: .infinity)
            .background(Color("BackgroundColor"))
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}

struct CustomButton: View {
    var text: String
    var showProgress = false
    var disabled = false
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: action, label: {
                Text(showProgress ? "" : text)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
            })
                .background(disabled ? Color("LightPrimaryColor") : Color("PrimaryColor"))
                .cornerRadius(50)
                .disabled(showProgress || disabled)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }


    }
}

struct CustomAlert: View {
    var title: String = "Alert"
    var content: String
    var buttonText: String = "Ok"
    
    var body : some View {
        Text("")
        .alert(isPresented: .constant(true)) {
            Alert(title: Text(title), message: Text(content), dismissButton: .default(Text(buttonText)) {
                //TODO somethings happens after error
            })
        }
    }
}
