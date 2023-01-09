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
        assambly.initialController(controller: self)
        view = contentView as? UIView
        title = R.TabBar.title(for: Tabs.translations)
    }
}

// MARK: - Private functions
private extension TranslationViewController {
}

// MARK: - TranslationViewControllerProtocol
extension TranslationViewController: TranslationViewControllerProtocol {
}
