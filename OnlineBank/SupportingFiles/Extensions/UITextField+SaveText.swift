//
//  UITextField+SaveText.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 09.01.2023.
//

import UIKit

extension UITextField {

    var txt: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
}
