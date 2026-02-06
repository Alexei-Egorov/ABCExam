//
//  CarouselView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct CarouselView: View {
    
    @ObservedObject var viewModel: CarouselViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            TabView(selection: $viewModel.currentIndex) {
                ForEach(Array(viewModel.items.enumerated()), id: \.element.id) { index, item in
                    if let imageName = viewModel.imageForItemAt(index: index) {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .tag(index)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: viewModel.currentIndex) { oldValue, newValue in
                viewModel.updateCurrentIndex(newValue)
            }
            
            HStack(spacing: 8) {
                ForEach(0..<viewModel.numberOfItems, id: \.self) { index in
                    Circle()
                        .fill(index == viewModel.currentIndex ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
        }
    }
}
