//
//  HomeViewModel.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let carouselItems: [CarouselItem]
    
    // MARK: - Initialization
    
    init(carouselItems: [CarouselItem]) {
        self.carouselItems = carouselItems
    }
    
    // MARK: - Public API
    
    func getCarouselViewModel() -> CarouselViewModel {
        print("items: \(carouselItems)")
        return .init(items: carouselItems)
    }
}
