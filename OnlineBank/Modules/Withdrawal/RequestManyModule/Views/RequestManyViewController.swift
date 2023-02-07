//
//  RequestManyViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol RequestManyViewControllerProtocol: AnyObject {
}

final class RequestManyViewController: UIViewController {
    
    var presenter: RequestManyPresenterProtocol?
    var contentView: RequestManyContentViewProtocol?
    private let assembly: RequestManyAssemblyProtocol = RequestManyAssembly()

    // MARK: - Inition View
    init(contentView: RequestManyContentView) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Loading View
    override func loadView() {
        assembly.initialController(controller: self)
        view = contentView as? UIView
    }
}

// MARK: - Private functions
private extension RequestManyViewController {
}

// MARK: - RequestManyViewControllerProtocol
extension RequestManyViewController: RequestManyViewControllerProtocol {
}
