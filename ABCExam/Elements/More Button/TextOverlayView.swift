//
//  TextOverlayView.swift
//  ABCExam
//
//  Created by Aliaksei Yahorau on 04/02/2026.
//

import SwiftUI

struct TextOverlayView: View {
    
    @Binding var isPresented: Bool
    let text: String

    private let horizontalPadding: CGFloat = 16

    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }

                VStack {
                    Spacer()

                    Text(text)
                        .padding()
                        .frame(
                            maxWidth: UIScreen.main.bounds.width - horizontalPadding * 2,
                            alignment: .leading
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                                .shadow(radius: 10)
                        )
                        .padding(.horizontal, horizontalPadding)
                        .padding(.bottom, 24)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
