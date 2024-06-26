//
//  ListTile.swift
//  WhatsAppClone
//
//  Created by Developer on 22.06.2024.
//

import SwiftUI

struct ListTile: View {
    let action: () -> Void
    let title: String
    let icon: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Label(
                title: {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        
                },
                icon: {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15.0 ,height: 15.0)
                        .padding(14.0)
                        .background(
                            Circle()
                                .fill(Color(.systemGray4))
                        )
                }
            )
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ListTile(
        action: { },
        title: "Tile",
        icon: "plus"
    )
}
