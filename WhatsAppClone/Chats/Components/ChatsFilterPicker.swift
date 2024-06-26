//
//  ChatsFilter.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct ChatsFilterPicker: View {
    @Binding private var selection: ChatFilter
    init(selection: Binding<ChatFilter>?) {
        _selection = selection ?? .constant(.all)
    }
    var body: some View {
        HStack {
            ForEach(ChatFilter.allCases, id: \.self) { filter in
                Button {
                    selection = filter
                } label: {
                    Text("\(filter.title)")
                        .tag(filter)
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 10.0)
                }
                .background( selection == filter ? .accent : Color(.systemGray))
                .clipShape(.rect(cornerRadius: 40.0))
            }
        }
    }
}

#Preview {
    ChatsFilterPicker(selection: .constant(.groups))
}
