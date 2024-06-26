//
//  MessagesData.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation


var messages: [Message] = [
    Message(sender: me, receiver: david, message: "Hi"),
    Message(sender: me, receiver: jane, message: "When will meet"),
    Message(sender: me, receiver: matthew, message: "What's your point"),
    Message(sender: me, receiver: amy, message: "I want you to meet with David", isRead: true),
    Message(sender: amy, receiver: me, message: "He asked me and I said Noo !!")
]
