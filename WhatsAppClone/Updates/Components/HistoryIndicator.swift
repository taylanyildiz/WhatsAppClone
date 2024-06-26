//
//  HistoryIndicator.swift
//  WhatsAppClone
//
//  Created by Developer on 25.06.2024.
//

import SwiftUI
import Combine

struct HistoryIndicator: View {
    let progress: Double
    let length: Int
    let spacing = 3.0
    
    var body: some View {
        GeometryReader { geometry in
            let width = ((geometry.size.width -  CGFloat(Double((length - 1)) * spacing)) / CGFloat(length))
            
            HStack(spacing: spacing) {
                ForEach(0 ..< length, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(.gray)
                        .frame(width: width ,height: 4, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4.0)
                                .fill(.red)
                                .frame(width: width * min(CGFloat(progress) - CGFloat(index), 1.0))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .animation(.smooth, value: progress)
                        )
                }
            }
        }
        .padding()
    }
}

#Preview {
    HistoryIndicator(
        progress: 0.0,
        length: 4
    )
}
