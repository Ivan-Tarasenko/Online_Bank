//
//  RegistrationAssambly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation

protocol RegistrationAssamblyProtocol: AnyObject {
    func initialView(view: RegistrationContentView)
    func initialController(controller: RegistrationViewController)
}

final class RegistrationAssambly: RegistrationAssamblyProtocol {

    func initialView(view: RegistrationContentView) {
        let presenter = RegistrationPresenter(view)
        let interactor = RegistrationInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: RegistrationViewController) {
        let presenter = RegistrationPresenter(controller)
        let router = RegistrationRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
