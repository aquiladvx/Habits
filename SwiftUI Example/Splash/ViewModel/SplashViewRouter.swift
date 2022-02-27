//
//  SplashViewRouter.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

enum SplashViewRouter {
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
