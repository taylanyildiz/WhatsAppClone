//
//  CircleAvatar.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct CircleAvatar: View {
    let url: String?
    let text: String?
    let size: Double
    
    init(url: String? = nil, text: String? = nil, size: Double? = nil) {
        self.url = url
        self.text = text
        self.size = size ?? 80.0
    }
    
    var body: some View {
        Group {
            if let url = url {
                AsyncImage(url: URL(string: url)) { data in
                    if let error = data.error {
                        Text(error.localizedDescription)
                    } else if let image = data.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: size, height: size)
                            .clipShape(Circle())
                    } else {
                        ProgressView()
                            .tint(.white)
                            .frame(width: size, height: size)
                    }
                }
            } else if let text = text {
                Text(text.avatar)
                    .frame(width: size, height: size)
            }
        }
        .background(
            Circle()
                .fill(Color(.systemGray))
                .frame(width: size, height: size)
        )
    }
}

#Preview {
    CircleAvatar(text: "Taylan YILDIZ")
}
