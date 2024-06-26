//
//  User.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation


struct User: Hashable, Identifiable {
    let id: String
    var name: String
    let phoneCode: String
    let phone: String
    let profile: String?
    let about: String?
    let online: Bool
    
    init(name: String, phoneCode: String, phone: String, profile: String? = nil, about: String? = nil, online: Bool = true) {
        self.id = UUID().uuidString
        self.name = name
        self.phoneCode = phoneCode
        self.phone = phone
        self.profile = profile
        self.about = about
        self.online = online
    }
}
