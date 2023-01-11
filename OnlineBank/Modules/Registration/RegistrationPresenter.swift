//
//  RegistrationPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation

protocol RegistrationPresenterProtocol: AnyObject {
    init(_ view: RegistrationContentViewProtocol)
    init(_ controller: RegistrationViewControllerProtocol)

    func pressedRegistration()
}

final class RegistrationPresenter {

    weak var viewController: RegistrationViewControllerProtocol?
    weak var view: RegistrationContentViewProtocol?
    var interactor: RegistrationInteractorProtocol!
    var router: RegistrationRouterProtocol!

    required init(_ view: RegistrationContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: RegistrationViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - RegistrationPresenterProtocol
extension RegistrationPresenter: RegistrationPresenterProtocol {
    func pressedRegistration() {
        router.transitionOnNewProduct()
    }
}
