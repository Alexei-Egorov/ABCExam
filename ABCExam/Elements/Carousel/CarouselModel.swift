//
//  CarouselModel.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import Foundation
import SwiftUI

struct CarouselItem: Identifiable {
    
    let id: UUID
    let imageName: String
    
    init(imageName: String) {
        self.id = UUID()
        self.imageName = imageName
    }
}

extension Array where Element == CarouselItem {
    
    static let mocks: [CarouselItem] = {
        let numberOfItems = 5
        var items: [CarouselItem] = []
        for i in 1...numberOfItems {
            items.append(.init(imageName: "image \(i)"))
        }
        return items
    }()
}
