//
//  RegistrationRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import UIKit

protocol RegistrationRouterProtocol: AnyObject {
    
    init(_ viewController: RegistrationViewController)
    
    func transitionOnNewProduct()
}

final class RegistrationRouter {

    weak var viewController: RegistrationViewController?

    init(_ viewController: RegistrationViewController) {
        self.viewController = viewController
    }
}

// MARK: - RegistrationRouterProtocol
extension RegistrationRouter: RegistrationRouterProtocol {
    func transitionOnNewProduct() {

        let bar = TabBarViewController()
        bar.modalPresentationStyle = .fullScreen
        viewController?.present(bar, animated: false)
    }
}
