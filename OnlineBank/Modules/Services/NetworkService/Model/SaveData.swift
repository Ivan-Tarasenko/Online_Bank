//
//  SaveData.swift
//  Calculator
//
//  Created by Иван Тарасенко on 13.07.2022.
//

import Foundation

private struct KeysDefaults {
    static let keyData = "data"
}

final class SaveData {

    private let defaults = UserDefaults.standard

    var data: Data? {
        get {
            return defaults.data(forKey: KeysDefaults.keyData)
        }
        set {
            if let data = newValue {
                defaults.set(data, forKey: KeysDefaults.keyData)
            }
        }
    }
}
