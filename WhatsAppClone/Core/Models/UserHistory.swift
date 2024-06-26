//
//  UserHistory.swift
//  WhatsAppClone
//
//  Created by Developer on 24.06.2024.
//

import Foundation


struct UserHistory: Hashable, Identifiable {
    var id: User.ID { user.id }
    let user: User
    let histories: [History]
}
