//
//  CurrentUserStatus.swift
//  WhatsAppClone
//
//  Created by Developer on 24.06.2024.
//

import SwiftUI

struct CurrentUserStatus: View {
    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                CircleAvatar(
                    url: me.profile,
                    text: me.name
                )
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25.0, height: 25.0)
                }
                .background(.white)
                .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text("My status")
                Text("Add to my status")
            }
            Spacer()
            Group {
                Button {
                    
                } label: {
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30.0, height: 30.0)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30.0, height: 30.0)
                }
            }
            .foregroundStyle(.blue)
        }
    }
}

#Preview {
    CurrentUserStatus()
}
