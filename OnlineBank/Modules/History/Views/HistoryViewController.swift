//
//  HistoryViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol HistoryViewControllerProtocol: AnyObject {
}

final class HistoryViewController: UIViewController {
    
    var presenter: HistoryPresenterProtocol?
    var contentView: HistoryContentViewProtocol?
    private let assambly: HistoryAssamblyProtocol = HistoryAssambly()

    // MARK: - Inition View
    init(contentView: HistoryContentView) {
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
        title = R.TabBar.title(for: Tabs.history)
    }
}

// MARK: - Private functions
private extension HistoryViewController {
}

// MARK: - HistoryViewControllerProtocol
extension HistoryViewController: HistoryViewControllerProtocol {
}
