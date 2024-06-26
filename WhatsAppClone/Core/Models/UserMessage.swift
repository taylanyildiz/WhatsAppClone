//
//  UserMessage.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation


struct UserMessage: Hashable, Identifiable {
    var id: String { user.id }
    let user: User
    private(set) var chats: [Message]
    
    mutating func addMessage(_ message: Message) -> Void {
        chats.append(message)
    }
}
