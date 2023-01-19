//
//  TranslationViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol TranslationViewControllerProtocol: AnyObject {
}

final class TranslationViewController: UIViewController {
    
    var presenter: TranslationPresenterProtocol?
    var contentView: TranslationContentViewProtocol?
    private let assambly: TranslationAssamblyProtocol = TranslationAssambly()

    // MARK: - Inition View
    init(contentView: TranslationContentView) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Loading View
    override func loadView() {
        setController()
        cardToCardPressed()
        depositReplenishmentPressed()
        byPhoneNumberPressed()
        topUpPhoneNumberPressed()
    }
}

// MARK: - Private functions
private extension TranslationViewController {

    func setController() {
        assambly.initialController(controller: self)
        view = contentView as? UIView
        title = R.TabBar.title(for: Tabs.translations)
    }

    func cardToCardPressed() {
        contentView?.onCardToCardAction = { [weak self] _ in
            guard let self else { return }
            self.router.transitionOnCardToCard()
        }
    }

    func depositReplenishmentPressed() {
        contentView?.onDepositReplenishmentAction = { [weak self] _ in
            guard let self else { return }
            self.router.transitionOnDepositReplenisshment()
        }
    }

    func byPhoneNumberPressed() {
        contentView?.onByPhoneNumberAction = { [weak self] _ in
            guard let self else { return }
            self.router.transitionOnByPhoneNumber()
        }
    }

    func topUpPhoneNumberPressed() {
        contentView?.onTopUpPhoneNumderAction = { [weak self] _ in
            guard let self else { return }
            self.router.transitionTopUpPhoneNumber()
        }
    }
}

// MARK: - TranslationViewControllerProtocol
extension TranslationViewController: TranslationViewControllerProtocol {
}
