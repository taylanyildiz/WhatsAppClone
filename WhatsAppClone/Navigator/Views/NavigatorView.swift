//
//  NavigatorView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct NavigatorView: View {
    @State private var selection: Int = 3
    @State private var isTabShown = true
    @State private var title = "test"
    var body: some View {
        TabView(selection: $selection) {
                UpdatesView()
                    .tabItem {
                       Label("Updates", systemImage: selection == 0 ? "circle.dashed.inset.filled" : "circle.dashed")
                    }
                    .onTapGesture {
                        isTabShown = false
                    }
                    .tag(0)
                
                Text("Calls")
                    .tabItem {
                       Label("Calls", systemImage: "phone")
                            .environment(\.symbolVariants, selection == 1 ? .fill : .none)
                    }
                    .tag(1)
                
                Text("Communities")
                    .tabItem {
                       Label("Communities", systemImage: "person.3")
                            .environment(\.symbolVariants, selection == 2 ? .fill : .none)
                    }
                    .tag(2)
                
                ChatsView()
                    .tabItem {
                       Label("Chats", systemImage: "bubble.left.and.bubble.right")
                            .environment(\.symbolVariants, selection == 3 ? .fill : .none)
                    }
                    .tag(3)
                
                Text("Settings")
                    .tabItem {
                       Label("Settings", systemImage: "gearshape")
                            .environment(\.symbolVariants, selection == 4 ? .fill : .none)
                    }
                    .tag(4)
        }
        .tint(.blue)
    }
}

#Preview {
    NavigatorView()
}
