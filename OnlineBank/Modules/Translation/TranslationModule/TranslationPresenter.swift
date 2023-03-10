//
//  TranslationPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol TranslationPresenterProtocol: AnyObject {
    init(_ view: TranslationContentViewProtocol)
    init(_ controller: TranslationViewControllerProtocol)

    func cardToCardPressed()
    func depositReplenishmentPressed()
    func byPhoneNumberPressed()
    func topUpPhoneNumberPressed()
}

final class TranslationPresenter {

    weak var viewController: TranslationViewControllerProtocol?
    weak var view: TranslationContentViewProtocol?
    var interactor: TranslationInteractorProtocol!
    var router: TranslationRouterProtocol!

    required init(_ view: TranslationContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: TranslationViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - TranslationPresenterProtocol
extension TranslationPresenter: TranslationPresenterProtocol {

    func cardToCardPressed() {
        router.transitionOnCardToCard()
    }

    func depositReplenishmentPressed() {
        router.transitionOnDepositReplenishment()
    }

    func byPhoneNumberPressed() {
        router.transitionOnByPhoneNumber()
    }
    
    func topUpPhoneNumberPressed() {
        router.transitionTopUpPhoneNumber()
    }

}
