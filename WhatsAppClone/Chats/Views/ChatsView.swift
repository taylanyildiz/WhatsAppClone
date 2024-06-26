//
//  ChatsView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct ChatsView: View {
    @State private var search: String = ""
    @State private var selectionFilter: ChatFilter = ChatFilter.all
    @State private var selectedChat: UserMessage?
    @State private var userChats: [UserMessage] =  []
    @State private var newChat: Bool = false
    @State private var selectionUser: User?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ChatsFilterPicker(selection: $selectionFilter)
                        .padding(.bottom)
                    ForEach(userChats){ chat in
                        ChatItem(chat: chat.chats.last!)
                            .onTapGesture {
                                selectedChat = chat
                            }
                    }
                }
            }
            .padding(.vertical, 5.0)
            .padding(.horizontal)
            .navigationDestination(item: $selectedChat) { chat in
                ChatDetail(userChat: chat)
                    .toolbar(.hidden, for: .tabBar)
            }
            .sheet(isPresented: $newChat, content: {
                UsersSheet(user: $selectionUser)
            })
            .navigationTitle("Chats")
            .searchable(text: $search, prompt: Text("Search"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button {
                            
                        } label: {
                            Text("Select Chats")
                            Spacer()
                            Image(systemName: "checkmark.circle")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.blue)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "camera.circle")
                                .foregroundStyle(.blue)
                        }
                        Button {
                            newChat = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30.0, height: 30.0)
                        }
                    }
                }
            }
            .onAppear {
                let userMessages = users.map({ user in
                    let chats = messages.filter { message in
                        return message.sender == user || message.receiver == user
                    }
                    return  UserMessage(user: user, chats: chats)
                })
                
                userChats = userMessages.filter { userChat in
                    !userChat.chats.isEmpty
                }
                
                
            }
            .onChange(of: messages) { _, _ in
                let userMessages = users.map({ user in
                    let chats = messages.filter { message in
                        return message.sender == user || message.receiver == user
                    }
                    return  UserMessage(user: user, chats: chats)
                })
                
                userChats = userMessages.filter { userChat in
                    !userChat.chats.isEmpty
                }
            }
            .onChange(of: selectionUser) { _, _ in
                guard let user = selectionUser else { return }
                guard let findChat = userChats.first(where: {$0.user == user}) else {
                    selectedChat = UserMessage(user: user, chats: [])
                    return
                }
                selectedChat = findChat
            }
            
        }
    }
}

#Preview {
    ChatsView()
}
