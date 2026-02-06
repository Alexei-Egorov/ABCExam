//
//  ContentView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel(cities: .stubs)
    
    var body: some View {
        VStack {
            CarouselView(viewModel: viewModel.carouselViewModel)
                .frame(height: 250)
            
            SearchTextField(text: $viewModel.searchText)
                .frame(height: 40)
            
            List(viewModel.cities) { city in
                CityView(viewModel: .init(city: city))
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
            }
            .listStyle(.plain)
            
        }
        .padding(20)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    HomeView()
}
