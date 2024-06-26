//
//  SplashView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var welCome: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Icon(Icons.whatsAppBlack, size: 80.0)
                Spacer()
                VStack(spacing: 0.0) {
                    Text("from")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray))
                    HStack(spacing: 2.0) {
                        Icon(Icons.meta, size: 20.0)
                        Text("Meta")
                            .font(.headline)
                    }
                }
            }
            .navigationDestination(isPresented: $welCome) {
                WelcomeView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    welCome = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
