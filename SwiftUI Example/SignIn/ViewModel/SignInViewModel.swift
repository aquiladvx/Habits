//
//  SignInViewModel.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .NONE
    
    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    
    init() {
        cancellable = publisher.sink { value in
            if value {
                self.uiState = .GO_TO_HOME
            }
        }
    }
    
    func login(email: String, password: String) {
        self.uiState = .LOADING
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.uiState = .FAILURE(errorMessage: "The email or password you’ve entered is incorrect")
            self.uiState = .GO_TO_HOME
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension SignInViewModel {
    func goToHome() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    
    func goToSignUp() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
