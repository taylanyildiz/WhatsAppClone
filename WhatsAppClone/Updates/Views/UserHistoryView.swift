//
//  UserHistoryView.swift
//  WhatsAppClone
//
//  Created by Developer on 24.06.2024.
//

import SwiftUI

struct UserHistoryView: View {
    let userHistory: UserHistory
    private var histories: [History] { userHistory.histories }
    @StateObject private var storyTimer = StoryTimer(length: 2)
    
    var body: some View {
        var size = UIScreen.main.bounds.size
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: histories[Int(storyTimer.progress)].image)) { data in
                if let image = data.image {
                    image
                        .resizable()
                        .scaledToFill()
                        
                } else if let error = data.error {
                    Text(error.localizedDescription)
                } else {
                    ProgressView()
                }
            }
            .frame(width: size.width, height: size.height)
            .ignoresSafeArea(.all)
            HistoryIndicator(progress: storyTimer.progress, length: histories.count)
                .padding(.top, 30)
        }
        .onAppear {
            self.storyTimer.start()
        }
    }
}

#Preview {
    UserHistoryView(userHistory: userHistories.first!)
}
