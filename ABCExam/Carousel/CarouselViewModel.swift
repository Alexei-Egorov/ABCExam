//
//  CarouselViewModel.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import Foundation
import SwiftUI
import Combine

class CarouselViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var items: [CarouselItem] = []
    @Published var currentIndex: Int = 0
    
    var numberOfItems: Int {
        items.count
    }
    
    // MARK: - Initialization
    
    init(items: [CarouselItem]) {
        self.items = items
    }
    
    // MARK: - Public Methods
    
    func imageForItemAt(index: Int) -> String? {
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index].imageName
    }
    
    func updateCurrentIndex(_ index: Int) {
        guard index >= 0 && index < items.count else {
            return
        }
        currentIndex = index
    }
    
    func moveToNext() {
        guard !items.isEmpty else { return }
        currentIndex = (currentIndex + 1) % items.count
    }
    
    func moveToPrevious() {
        guard !items.isEmpty else { return }
        currentIndex = (currentIndex - 1 + items.count) % items.count
    }
}
