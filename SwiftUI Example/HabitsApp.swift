//
//  HabitsApp.swift
//  Habits
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

@main
struct HabitsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
