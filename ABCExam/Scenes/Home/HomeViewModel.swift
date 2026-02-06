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
    
    private let allCities: [City]
    
    @Published var searchText: String = ""
    @Published var cities: [City]
    let carouselViewModel: CarouselViewModel
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init(cities: [City]) {
        self.allCities = cities
        self.cities = cities
        let carouselItems = cities.map({ CarouselItem(imageName: $0.imageName) })
        self.carouselViewModel = .init(items: carouselItems)
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        $searchText
            .dropFirst()
            .sink
        { [weak self] searchText in
            guard let self else { return }
            if searchText.isEmpty {
                self.cities = allCities
            } else {
                self.cities = self.allCities.filter({ $0.title.contains(searchText) })
            }
        }.store(in: &subscriptions)
    }
}
