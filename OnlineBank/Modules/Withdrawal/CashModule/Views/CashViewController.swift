//
//  CashViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit

protocol CashViewControllerProtocol: AnyObject {
}

final class CashViewController: UIViewController {
    
    var presenter: CashPresenterProtocol?
    var contentView: CashContentViewProtocol?
    private let assambly: CashAssamblyProtocol = CashAssambly()

    // MARK: - Inition View
    init(contentView: CashContentView) {
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
private extension CashViewController {
}

// MARK: - CashViewControllerProtocol
extension CashViewController: CashViewControllerProtocol {
}
