//
//  UILabel+SaveText.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 15.01.2023.
//

import UIKit

extension UILabel {

    var txt: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
}
