//
//  Resources.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

enum R {
    enum TabBar {
        static func title(for tab: Tabs) -> String {
            switch tab {
            case .main: return NSLocalizedString("Main", comment: "main screen")
            case .translations: return NSLocalizedString("Translations", comment: "translations screen")
            case .withdrawal: return NSLocalizedString("Withdrawal", comment: "withdrawal screen")
            case .history: return NSLocalizedString("History", comment: "history screen")
            }
        }

        static func icon(for tab: Tabs) -> String {
            switch tab {
            case .main: return "creditcard"
            case .translations: return "arrow.up.arrow.down.square"
            case .withdrawal: return "chevron.up.square"
            case .history: return "clock"
            }
        }
    }

    enum Colors {
        static let separator = UIColor(hexString: "#E8ECEF")
        static let background = UIColor(hexString: "#F8F9F9")
    }

    enum Titles {
        enum MainScreen {
            static let addProductTitle = NSLocalizedString("addProductButton", comment: "")
        }
    }
}
