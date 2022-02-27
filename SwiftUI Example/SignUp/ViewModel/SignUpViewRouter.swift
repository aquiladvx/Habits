//
//  SignUpViewRouter.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-27.
//

import SwiftUI

enum SignUpViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
