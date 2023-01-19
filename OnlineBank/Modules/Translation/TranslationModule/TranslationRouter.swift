//
//  TranslationRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol TranslationRouterProtocol: AnyObject {

    init(_ viewController: TranslationViewController)

    func transitionOnCardToCard()
    func transitionOnDepositReplenisshment()
    func transitionOnByPhoneNumber()
    func transitionTopUpPhoneNumber()
}

final class TranslationRouter {

    weak var viewController: TranslationViewController?

    init(_ viewController: TranslationViewController) {
        self.viewController = viewController
    }
}

// MARK: - TranslationRouterProtocol
extension TranslationRouter: TranslationRouterProtocol {

    func transitionOnCardToCard() {
        let cardToCardController = FromCardToCardViewController(contentView: FromCardToCardContentView())
        viewController?.present(cardToCardController, animated: true)
    }
    func transitionOnDepositReplenishment() {
        let depositReplenishmentController = DepositReplenishmentViewController(contentView: DepositReplenishmentContentView())
        viewController?.present(depositReplenishmentController, animated: true)
    }
    func transitionOnByPhoneNumber() {
        let byPhoneNumberController = ByPhoneNumberViewController(contentView: ByPhoneNumberContentView())
        viewController?.present(byPhoneNumberController, animated: true)
    }
    func transitionTopUpPhoneNumber() {
        let topUpPhoneNumderController = TopUpPhoneNumderViewController(contentView: TopUpPhoneNumderContentView())
        viewController?.present(topUpPhoneNumderController, animated: true)
    }
}
