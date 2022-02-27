//
//  SignUpViewModel.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-27.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var uiState: SignUpUIState = .NONE
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    func signUp() {
        self.uiState = .LOADING
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.uiState = .FAILURE(errorMessage: "Deu merda")
            self.uiState = .SUCCESS
            self.publisher.send(true)
        }
    }
}
