//
//  NewProductViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol NewProductViewControllerProtocol: AnyObject {
}

final class NewProductViewController: UIViewController {
    
    var presenter: NewProductPresenterProtocol?
    var contentView: NewProductContentViewProtocol?
    private let assambly: NewProductAssamblyProtocol = NewProductAssambly()

    // MARK: - Inition View
    init(contentView: NewProductContentView) {
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
private extension NewProductViewController {
}

// MARK: - NewProductViewControllerProtocol
extension NewProductViewController: NewProductViewControllerProtocol {
}
