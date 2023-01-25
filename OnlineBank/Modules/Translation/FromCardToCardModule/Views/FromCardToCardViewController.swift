//
//  FromCardToCardViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol FromCardToCardViewControllerProtocol: AnyObject {
}

final class FromCardToCardViewController: UIViewController {
    
    var presenter: FromCardToCardPresenterProtocol?
    var contentView: FromCardToCardContentViewProtocol?
    private let assambly: FromCardToCardAssamblyProtocol = FromCardToCardAssambly()

    // MARK: - Inition View
    init(contentView: FromCardToCardContentView) {
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
private extension FromCardToCardViewController {
}

// MARK: - FromCardToCardViewControllerProtocol
extension FromCardToCardViewController: FromCardToCardViewControllerProtocol {
}
