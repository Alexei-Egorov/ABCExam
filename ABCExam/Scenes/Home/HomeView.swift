//
//  ContentView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel(cities: .stubs)
    @State private var showOverlay = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    CarouselView(viewModel: viewModel.carouselViewModel)
                        .frame(height: 250)
                    
                    SearchTextField(text: $viewModel.searchText)
                        .frame(height: 40)
                    
                    LazyVStack(spacing: 4) {
                        ForEach(viewModel.cities) { city in
                            CityView(viewModel: .init(city: city))
                                .padding(.vertical, 2)
                        }
                    }
                }
                .padding(20)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    MoreButtonView(isPresented: $showOverlay)
                }
                .padding(20)
            }
            
            TextOverlayView(isPresented: $showOverlay, text: viewModel.getStatistics())
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    HomeView()
}
