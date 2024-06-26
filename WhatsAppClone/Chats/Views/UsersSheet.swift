//
//  UsersSheet.swift
//  WhatsAppClone
//
//  Created by Developer on 22.06.2024.
//

import SwiftUI

struct UsersSheet: View {
    @Binding var user: User?
    @Environment(\.dismiss) private var dismiss: DismissAction

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Group {
                        ListTile(
                            action: { },
                            title: "New Group",
                            icon: "person.2.fill"
                        )
                        ListTile(
                            action: { },
                            title: "New contact",
                            icon: "person.fill.badge.plus"
                        )
                        ListTile(
                            action: { },
                            title: "New community",
                            icon: "person.3.fill"
                        )
                        ListTile(
                            action: { },
                            title: "New broadcast",
                            icon: "megaphone.fill"
                        )
                    }
                    .listRowInsets(EdgeInsets(top: 10.0, leading: 15.0, bottom: 10.0, trailing: 15.0))
                }
                
                Section {
                    ForEach(users) { user in
                        HStack {
                            CircleAvatar(
                                url: user.profile,
                                text: user.name,
                                size: 45.0
                            )
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                if let about = user.about {
                                    Text(about)
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color(.systemGray))
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))
                        .onTapGesture {
                            dismiss()
                            self.user = user
                        }
                    }
                }
            }
            .navigationTitle("New Chat")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    UsersSheet(user: .constant(nil))
}
