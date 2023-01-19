//
//  ByPhoneNumberViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol ByPhoneNumberViewControllerProtocol: AnyObject {
}

final class ByPhoneNumberViewController: UIViewController {
    
    var presenter: ByPhoneNumberPresenterProtocol?
    var contentView: ByPhoneNumberContentViewProtocol?
    private let assambly: ByPhoneNumberAssamblyProtocol = ByPhoneNumberAssambly()

    // MARK: - Inition View
    init(contentView: ByPhoneNumberContentView) {
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
private extension ByPhoneNumberViewController {
}

// MARK: - ByPhoneNumberViewControllerProtocol
extension ByPhoneNumberViewController: ByPhoneNumberViewControllerProtocol {
}
