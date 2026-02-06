//
//  CityView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 05/02/2026.
//

import SwiftUI

struct CityView: View {
    
    let viewModel: CityViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                Text(viewModel.subtitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(5)
        .background(Color.appCyan)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CityView(viewModel: .init(city: .stub))
}
