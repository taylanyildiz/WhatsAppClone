//
//  WelcomeView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
                WelcomeIcon()
                Text("Welcome to WhatsApp")
                    .font(.title)
                    .fontWeight(.bold)
                WelcomeText()
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Agree & Continue")
                        .font(.system(size: 20.0, weight: .semibold))
                        .foregroundStyle(.blue)
                }

            }
            .padding(.horizontal, 5.0)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    WelcomeView()
}
