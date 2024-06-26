//
//  WelcomeText.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct WelcomeText: View {
    
    private var text: AttributedString {
        var text = AttributedString("Read our ")
        text.foregroundColor = Color(.systemGray)
        var policy = AttributedString("Privacy Policy")
        policy.link = URL(string: "https://google.com")
        policy.foregroundColor = .blue
        var text1 = AttributedString(". Tap \"Agree & continue\" to accept the ")
        text1.foregroundColor = Color(.systemGray)
        var termsOfService = AttributedString("Terms of Service")
        termsOfService.link = URL(string: "https://google.com")
        termsOfService.foregroundColor = .blue
        text.append(policy)
        text.append(text1)
        text.append(termsOfService)
        text.font = .system(size: 15.0)
        return text
    }
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    WelcomeText()
}
