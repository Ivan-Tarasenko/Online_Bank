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
            static let placeholderNumberPhone = NSLocalizedString("numberPhone", comment: "")
        }

        enum MainScreen {
            static let currencyTitle = NSLocalizedString("currencyTitle", comment: "")
            static let addProductTitle = NSLocalizedString("addProductButton", comment: "")
            static let titileBalance = NSLocalizedString("titleBalance", comment: "")

            enum NewProduct {
                static let massage = NSLocalizedString("massageNewProduct", comment: "")
            }
        }

        enum TranslationScreen {
            static let titleMethodOfReplenishment = NSLocalizedString("titleMethodOfReplenishment", comment: "")
            static let fromCardToCard = NSLocalizedString("fromCardToCard", comment: "")
            static let betweenAccounts = NSLocalizedString("depositReplenishment", comment: "")
            static let byPhoneNumber = NSLocalizedString("byPhoneNumber", comment: "")
            static let topUpPhoneNumder = NSLocalizedString("topUpPhoneNumder", comment: "")
            
            enum FromCardToCard {
                static let massage = NSLocalizedString("massageFromCardToCard", comment: "")
            }
            
            enum ByPhoneNumber {
                static let massage = NSLocalizedString("massageByPhoneNumber", comment: "")
            }
            
            enum DepositReplinshment {
                static let depositReplinshmentTitle = NSLocalizedString("depositReplinshmentTitle", comment: "")
                static let placeholderFieldSum = NSLocalizedString("placeholderFieldSum", comment: "")
                static let enterButton = NSLocalizedString("enterButton", comment: "")
            }
            
            enum TopUpPhoneNumber {
                static let topUpLabel = NSLocalizedString("topUpLabel", comment: "")
                static let amountPlaceholder = NSLocalizedString("amountPlaceholder", comment: "")
                static let yesButton = NSLocalizedString("yesButton", comment: "")
                static let noButton = NSLocalizedString("noButton", comment: "")
                
                static let inputNumberLabel = NSLocalizedString("inputNumberLabel", comment: "")
                static let inputNumberPlaceholder = NSLocalizedString("inputNumberPlaceholder", comment: "")
                static let inputAmountPlaceholder = NSLocalizedString("inputAmountPlaceholder", comment: "")
                static let replenishButton = NSLocalizedString("replenishButton", comment: "")
            }
        }

        enum WithdrawalScreen {
            static let titleWithdrawal = NSLocalizedString("titleWithdrawal", comment: "")
            static let cash = NSLocalizedString("cash", comment: "")
            static let request = NSLocalizedString("request", comment: "")
            
            enum Cash {
                static let cashTitle = NSLocalizedString("cashTitle", comment: "")
                static let cashPlaceholder = NSLocalizedString("cashPlaceholder", comment: "")
                static let withdrawalButton = NSLocalizedString("withdrawalButton", comment: "")
                
            }
            
            enum Request {
                static let requestTitle = NSLocalizedString("requestTitle", comment: "")
            }
        }

        enum Alert {
            static let title = NSLocalizedString("titleAlert", comment: "")
            static let massage = NSLocalizedString("massage", comment: "")
        }

        enum Welcome {
            static let welcome = NSLocalizedString("welcome", comment: "")
        }
    }

    enum Fonts {
        static func ocrARegular(with size: CGFloat) -> UIFont {
            UIFont(name: "OCR-A-Regular", size: size) ?? .systemFont(ofSize: size)
        }

        static func ocrBRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "OCR-B 10 BT", size: size) ?? .systemFont(ofSize: size)
        }

        static func sfProDisplayRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "SF Pro Display Regular", size: size) ?? .systemFont(ofSize: size)
        }

        static func sfProDisplayMedium(with size: CGFloat) -> UIFont {
            UIFont(name: "SF Pro Display Medium", size: size) ?? .systemFont(ofSize: size)
        }

        static func sfProDisplayBolt(with size: CGFloat) -> UIFont {
            UIFont(name: "SF Pro Display Bold", size: size) ?? .systemFont(ofSize: size)
        }
    }
}
