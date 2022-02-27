//
//  SplashUIState.swift
//  Habits
//
//  Created by Davi Aquila on 2022-02-26.
//

import Foundation

enum SplashUIState {
    case LOADING
    case GO_TO_SIGNIN
    case GO_TO_HOME
    case FAILURE(errorMessage: String)
}
