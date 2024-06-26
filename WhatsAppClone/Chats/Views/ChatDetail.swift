//
//  ChatDetail.swift
//  WhatsAppClone
//
//  Created by Developer on 22.06.2024.
//

import SwiftUI

struct ChatDetail: View {
    @State private var message: String = ""
    
    @State var userChat: UserMessage
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(userChat.chats) { chat in
                            VStack(alignment: .trailing) {
                                switch chat.type {
                                case .image:
                                    Text("Image")
                                case .text:
                                    Text(chat.message)
                                }
                                Text("23:03")
                                    .font(.footnote)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .fill(chat.sender == me ? .accent : Color(.systemGray))
                            )
                            .frame(maxWidth: .infinity, alignment: chat.sender == me ? .trailing : .leading)
                        }
                    }
                    .padding()
                }
                Spacer()
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.black)
                    }
                    TextField("", text: $message)
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 10.0)
                        .background(
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color(.systemGray))
                        )
                        .animation(.easeOut, value: message)
                    if message.isEmpty {
                        Button {
                            
                        } label: {
                            Image(systemName: "camera")
                                .foregroundStyle(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "mic")
                                .foregroundStyle(.black)
                        }
                    } else {
                        Button {
                            let newMessage = Message(sender: me, receiver: userChat.user, message: message)
                            messages.append(newMessage)
                            userChat.addMessage(newMessage)
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .foregroundStyle(.black)
                                .rotationEffect(.degrees(45.0))
                        }
                        .padding(8.0)
                        .background(
                            Circle()
                                .fill(.accent)
                        )
                    }
                }
                .padding()
                .ignoresSafeArea()
                .background(Color(.systemGray6))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        CircleAvatar(url: userChat.user.profile, text: userChat.user.name, size: 40.0)
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text(userChat.user.name)
                                .font(.title3.bold())
                            Text( userChat.user.online ? "Online": "Offline")
                                .font(.footnote)
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "video")
                                .foregroundStyle(.black)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "phone")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ChatDetail(userChat: UserMessage(user: me, chats: messages))
}
