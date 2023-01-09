//
//  WithdrawalViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol WithdrawalViewControllerProtocol: AnyObject {
}

final class WithdrawalViewController: UIViewController {
    
    var presenter: WithdrawalPresenterProtocol?
    var contentView: WithdrawalContentViewProtocol?
    private let assambly: WithdrawalAssamblyProtocol = WithdrawalAssambly()

    // MARK: - Inition View
    init(contentView: WithdrawalContentView) {
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
        title = R.TabBar.title(for: Tabs.withdrawal)
    }
}

// MARK: - Private functions
private extension WithdrawalViewController {
}

// MARK: - WithdrawalViewControllerProtocol
extension WithdrawalViewController: WithdrawalViewControllerProtocol {
}
