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
    private let assembly: TranslationAssemblyProtocol = TranslationAssembly()

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
        assembly.initialController(controller: self)
        view = contentView as? UIView
        title = R.TabBar.title(for: Tabs.translations)
    }

    func cardToCardPressed() {
        contentView?.onCardToCardAction = {
            self.presenter?.cardToCardPressed()
        }
    }

    func depositReplenishmentPressed() {
        contentView?.onDepositReplenishmentAction = {
            self.presenter?.depositReplenishmentPressed()
        }
    }

    func byPhoneNumberPressed() {
        contentView?.onByPhoneNumberAction = {
            self.presenter?.byPhoneNumberPressed()
        }
    }

    func topUpPhoneNumberPressed() {
        contentView?.onTopUpPhoneNumderAction = {
            self.presenter?.topUpPhoneNumberPressed()
        }
    }
}

// MARK: - TranslationViewControllerProtocol
extension TranslationViewController: TranslationViewControllerProtocol {
}
