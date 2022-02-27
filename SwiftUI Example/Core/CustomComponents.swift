//
//  Components.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI


struct CustomTextField: View {
    var text: String
    var binding: Binding<String>
    var capitalization: TextInputAutocapitalization? = nil
    
    var body: some View {
        TextField(text, text: binding)
            .font(.title3)
            .padding()
            .textInputAutocapitalization(capitalization)
            .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
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
            .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
        })
            .background(Color.black)
            .cornerRadius(50)


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
