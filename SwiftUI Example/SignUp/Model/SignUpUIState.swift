//
//  SignUpUIState.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-27.
//

import Foundation

enum SignUpUIState {
    case NONE
    case LOADING
    case SUCCESS
    case FAILURE(errorMessage: String)
}
