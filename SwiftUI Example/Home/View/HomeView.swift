//
//  HomeView.swift
//  SwiftUI Example
//
//  Created by Davi Aquila on 2022-02-26.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.background(Color.red)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        HomeView(viewModel: viewModel)
    }
}
