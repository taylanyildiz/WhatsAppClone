//
//  Message.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation

enum MessageType {
    case text
    case image
}

struct Message: Hashable, Identifiable {
    let id: String
    let sender: User
    let receiver: User
    let message: String
    let type: MessageType
    let date: Date
    let isRead: Bool
    
    init(sender: User, receiver: User, message: String, type: MessageType = .text, date: Date = .now, isRead: Bool = false) {
        self.id = UUID().uuidString
        self.sender = sender
        self.receiver = receiver
        self.message = message
        self.type = type
        self.date = date
        self.isRead = isRead
    }
}
