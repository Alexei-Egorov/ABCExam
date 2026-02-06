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
    
    // MARK: - Setup Methods
    
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
    
    // MARK: - Public Methods
    
    func getStatistics() -> String {
        var counts: [Character: Int] = [:]
        let strings = allCities.map(\.title)
        
        for string in strings {
            for char in string.lowercased() {
                guard char.isLetter else { continue }
                counts[char, default: 0] += 1
            }
        }
        
        let top3 = counts.sorted { $0.value > $1.value }.prefix(3)
        
        var result = ""
        
        for item in top3 {
            result += "\(item.key) = \(item.value)\n"
        }
        
        return result
    }
}
