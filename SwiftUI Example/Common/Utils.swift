//
//  Utils.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-27.
//

import Foundation

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
