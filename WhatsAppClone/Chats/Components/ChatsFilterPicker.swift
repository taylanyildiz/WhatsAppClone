//
//  ChatsFilter.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct ChatsFilter: View {
    @State private var selection: Int = 0
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(0...2, id: \.self) { data in
                Text("\(data)")
                    .tag(data)
            }
        }
        .scrollContentBackground(.hidden)
        .pickerStyle(.segmented)
    }
}

#Preview {
    ChatsFilter()
}
