//
//  StringExtensions.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import Foundation



extension String {
    /// Phone Number Format
    ///  xxx xxx xx xx
    func formatPhoneNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "xxx xxx xx xx"
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "x" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }
    
    var avatar: Self {
        if isEmpty { return "" }
        let list = components(separatedBy: .whitespaces)
        if list.count == 1 {
            return list.first!.split(",").first!.uppercased()
        }
        let result =  list.map({ String($0).split(",").first!.uppercased() }).joined()
        return result
    }
    
    func split(_ value: String) -> [String] {
        return map({ String($0) }).joined(separator: value).components(separatedBy: value)
    }
}
