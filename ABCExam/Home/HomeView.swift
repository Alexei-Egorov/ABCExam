//
//  ContentView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel(carouselItems: .mocks)
    
    var body: some View {
        VStack {
            CarouselView(viewModel: viewModel.getCarouselViewModel())
        }
        .padding(20)
    }
}

#Preview {
    HomeView()
}
