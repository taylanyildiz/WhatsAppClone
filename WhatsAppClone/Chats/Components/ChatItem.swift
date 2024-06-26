//
//  ChatItem.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct ChatItem: View {
    let chat: Message
    var isMe: Bool { chat.sender == me }
    var user: User {
        if isMe { return chat.receiver }
        return chat.sender
    }
    
    var body: some View {
        HStack(alignment: .top) {
            CircleAvatar(
//                url: user.profile,
                text: user.name,
                size: 60.0
            )
            VStack(alignment: .leading, spacing: 5.0) {
                Text(user.name)
                    .font(.system(size: 18.0, weight: .semibold))
                HStack(spacing: 5.0) {
                    if isMe {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10.0, height: 10.0)
                            .foregroundStyle(chat.isRead ? .accent : Color(.systemGray))
                    }
                    switch chat.type {
                    case .text:
                        Text(chat.message)
                            .font(.subheadline)
                            .foregroundStyle(Color(.systemGray))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    case .image:
                        Text("Image")
                    }
                }
            }
            Spacer()
            Text("23:03")
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    ChatItem(chat: messages.last!)
}
