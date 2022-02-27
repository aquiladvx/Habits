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
    @State var document = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
    }
}
