//
//  TopUpPhoneNumderViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol TopUpPhoneNumderViewControllerProtocol: AnyObject {
}

final class TopUpPhoneNumderViewController: UIViewController {
    
    var presenter: TopUpPhoneNumderPresenterProtocol?
    var contentView: TopUpPhoneNumderContentViewProtocol?
    private let assambly: TopUpPhoneNumderAssamblyProtocol = TopUpPhoneNumderAssambly()

    // MARK: - Inition View
    init(contentView: TopUpPhoneNumderContentView) {
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
    }
}

// MARK: - Private functions
private extension TopUpPhoneNumderViewController {
}

// MARK: - TopUpPhoneNumderViewControllerProtocol
extension TopUpPhoneNumderViewController: TopUpPhoneNumderViewControllerProtocol {
}