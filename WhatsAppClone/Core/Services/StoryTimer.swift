//
//  StoryTimer.swift
//  WhatsAppClone
//
//  Created by Developer on 25.06.2024.
//

import Foundation
import Combine


final class StoryTimer: ObservableObject {
    
    @Published var progress: Double = 0.0
    private var length: Int
    private var timer: Timer.TimerPublisher
    private var cancellable: AnyCancellable?
    
    init(length: Int) {
        self.length = length
        self.timer = Timer.publish(every: 0.1, on: .current, in: .default)
    }
    
    
    func start() -> Void {
        cancellable = self.timer.autoconnect().sink { _ in
            var newProgress = self.progress + 0.1
            if newProgress >= CGFloat(self.length) { newProgress = 0}
            self.progress = newProgress
        }
    }
    
}
