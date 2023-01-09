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
        static let background = UIColor(hexString: "#F8F8F8")
    }

    enum Titles {
        enum RegisterScreen {
            static let title = NSLocalizedString("title", comment: "")
            static let registerButton = NSLocalizedString("registerButton", comment: "")
            static let placeholderName = NSLocalizedString("name", comment: "")
            static let placeholderSurName = NSLocalizedString("surname", comment: "")
            static let placeholderNumberCard = NSLocalizedString("numberCard", comment: "")
        }

        enum MainScreen {
            static let addProductTitle = NSLocalizedString("addProductButton", comment: "")
            static let titileBalance = NSLocalizedString("titleBalance", comment: "")
        }

        enum TranslationScreen {
            static let titleMethodOfReplenishment = NSLocalizedString("titleMethodOfReplenishment", comment: "")
            static let fromCardToCard = NSLocalizedString("fromCardToCard", comment: "")
            static let betweenAccounts = NSLocalizedString("betweenAccounts", comment: "")
            static let byPhoneNumber = NSLocalizedString("byPhoneNumber", comment: "")
            static let topUpPhoneNumder = NSLocalizedString("topUpPhoneNumder", comment: "")
        }

        enum WithdrawalScreen {
            static let titleWithdrawal = NSLocalizedString("titleWithdrawal", comment: "")
            static let cash = NSLocalizedString("cash", comment: "")
            static let request = NSLocalizedString("request", comment: "")
        }
    }

    enum Fonts {
        static func ocrARegular(with size: CGFloat) -> UIFont {
            UIFont(name: "OCR-A-Regular", size: size) ?? UIFont()
        }

        static func ocrBRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "OCR-B 10 BT", size: size) ?? UIFont()
        }
    }
}
