//
//  UserHistoryContain.swift
//  WhatsAppClone
//
//  Created by Developer on 24.06.2024.
//

import SwiftUI

struct UserHistoryContain: View {
    var userHistory: UserHistory
    private var user: User { userHistory.user }
    private var histories: [History] { userHistory.histories }
    private var lastHistory: History { histories.last! }
    
    var body: some View {
        HStack {
            ZStack {
                CircleAvatar(
                    url: lastHistory.image
                )
                .padding(3)
                .background(
                    Circle()
                        .fill(.accent)
                )
            }
            VStack(alignment: .leading) {
                Text(user.name)
                Text("3h ago")
            }
            Spacer()
        }
    }
}

#Preview {
    UserHistoryContain(userHistory: userHistories.first!)
}
