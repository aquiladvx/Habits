//
//  SignInUIState.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import Foundation

enum SignInUIState {
    case NONE
    case LOADING
    case GO_TO_HOME
    case FAILURE(errorMessage: String)
}
