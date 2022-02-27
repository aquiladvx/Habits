//
//  SignInView.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }.background(Color.blue)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
