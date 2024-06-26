//
//  ChatFilter.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation

enum ChatFilter: Int, Hashable, Identifiable, CaseIterable {
    var id: Int { self.rawValue }
    
    case all = 0
    case unread = 1
    case groups = 3
    
    var title: String {
        switch self {
        case .all:
            "All"
        case .unread:
            "Unread"
        case .groups:
            "Groups"
        }
    }
}
