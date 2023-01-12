//
//  RegistrationViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import UIKit

protocol RegistrationViewControllerProtocol: AnyObject {
}

final class RegistrationViewController: UIViewController {
    
    var presenter: RegistrationPresenterProtocol?
    var contentView: RegistrationContentViewProtocol?
    private let assambly: RegistrationAssamblyProtocol = RegistrationAssambly()


    var network = NetworkManager()

    // MARK: - Inition View
    init(contentView: RegistrationContentView) {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        transitionBar()
        network.fetchData { _ in
            print(self.network.currencies)
        }

    }
}

// MARK: - Private functions
private extension RegistrationViewController {
}

// MARK: - RegistrationViewControllerProtocol
extension RegistrationViewController: RegistrationViewControllerProtocol {

    func transitionBar() {
        contentView?.registrationAction = { [self] in
            presenter?.pressedRegistration()
        }
    }
}
