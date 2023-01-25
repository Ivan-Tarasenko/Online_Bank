//
//  GlobalFunc.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 22.01.2023.
//

import Foundation

class GlobalFunc {
    
    static func currentDate() -> String {
        let date = Date()
        let format = date.getFormattedDate(format: "dd. MMM yyyy HH:mm")
        return format
    }
    
    static func onlyDigit(for string: String) -> Bool {
        let forbiddenCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return forbiddenCharacters.isSuperset(of: characterSet)
    }
    
    static func noDigit(for string: String) -> Bool {
        let forbiddenCharacters = CharacterSet.decimalDigits.inverted
        let characterSet = CharacterSet(charactersIn: string)
        return forbiddenCharacters.isSuperset(of: characterSet)
    }
}
