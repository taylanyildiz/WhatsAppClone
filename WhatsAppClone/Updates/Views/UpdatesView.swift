//
//  UpdatesView.swift
//  WhatsAppClone
//
//  Created by Developer on 24.06.2024.
//

import SwiftUI

struct UpdatesView: View {
    @State private var search: String = ""
    @State private var selectedHistory: UserHistory?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Form {
                    Section {
                        CurrentUserStatus()
                            .padding(.horizontal)
                            .padding(.vertical, 6.0)
                            .background(
                                Rectangle()
                                    .opacity(0.2)
                                    .blur(radius: 1.0)
                            )
                            
                    } header: {
                        Text("Status")
                            .listRowInsets(EdgeInsets())
                            .font(.headline)
                            .fontWeight(.bold)
                            .textCase(nil)
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                    }
                    Section {
                        ForEach(userHistories) { userHistory in
                            UserHistoryContain(userHistory: userHistory)
                                .padding(.horizontal)
                                .padding(.vertical, 6.0)
                                .background(
                                    Rectangle()
                                        .opacity(0.2)
                                        .blur(radius: 1.0)
                                )
                                .onTapGesture {
                                    selectedHistory = userHistory
                                }
                        }
                    } header: {
                        Text("RECENT UPDATES")
                            .listRowInsets(EdgeInsets())
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                    }
                }
                
            }
            .navigationDestination(item: $selectedHistory, destination: { history in
                UserHistoryView(userHistory: history)
                    .toolbar(.hidden, for: .tabBar)
            })
            .formStyle(.columns)
            .searchable(text: $search, prompt: Text("Search"))
            .navigationTitle("Updates")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button(action: {}, label: {
                            Text("Status privacy")
                            Spacer()
                            Image(systemName: "lock")
                        })
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .foregroundStyle(.blue)
                    }

                }
            }
        }
    }
}

#Preview {
    UpdatesView()
}
