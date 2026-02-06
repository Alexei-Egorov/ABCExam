//
//  MoreButton.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct MoreButtonView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Button {
                withAnimation {
                    isPresented = true
                }
            } label: {
                Circle()
                    .fill(Color.appBlue)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.white)
                    }
                    .shadow(radius: 4)
            }
        }
    }
}
