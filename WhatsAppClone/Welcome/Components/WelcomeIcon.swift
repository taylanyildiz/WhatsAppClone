//
//  WelcomeIcon.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct WelcomeIcon: View {
    @State private var scaleEffect: Bool = false
    
    private var animation: Animation {
        .linear
        .speed(0.2)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Icon(Icons.whatsappCircle, size: 100.0)
            .animation(nil, value: scaleEffect)
            .background(
                VStack {
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(Color.accentColor.opacity(scaleEffect ? 0.0 : 1.0))
                            .scaleEffect(scaleEffect ?  1.0 : 0.0, anchor: .center)
                        Circle()
                            .fill(Color.accentColor.opacity(scaleEffect ? 0.0 : 1.0))
                            .scaleEffect(scaleEffect ?  0.8 : 0.0, anchor: .center)
                           
                    }
                }
                    .frame(width: 200, height: 200, alignment: .center)
            )
        .onAppear {
            withAnimation(animation) {
                scaleEffect = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeIcon()
        Text("GHome")
    }
}
