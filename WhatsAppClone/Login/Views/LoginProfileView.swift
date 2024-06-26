//
//  LoginProfileView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct LoginProfileView: View {
    @State private var name: String = ""
    @State private var about: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Enter your name and About")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                HStack {
                    Circle()
                        .frame(width: 60.0 , height: 60.0)
                    VStack(spacing: 5.0) {
                        TextField("Name", text: $name)
                        Divider()
                        TextField("About", text: $about)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(Color(.systemGray4))
                )
                Spacer()
                Button {
                    
                } label: {
                    Text("Done")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10.0))
            }
            .padding()
            .navigationTitle("Profile")
        }

    }
}

#Preview {
    LoginProfileView()
}
