//
//  Icon.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct Icon: View {
    private let icon: Icons
    private let size: Double
    
    init(_ icon: Icons, size: Double? = nil) {
        self.icon = icon
        self.size = size ?? 30.0
    }
    
    var body: some View {
        Image(icon.rawValue)
            .resizable()
            .frame(width: size, height: size)
    }
}

#Preview {
    Icon(Icons.meta)
}
