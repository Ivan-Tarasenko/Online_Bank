//
//  RegistrationAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation

protocol RegistrationAssemblyProtocol: AnyObject {
    func initialView(view: RegistrationContentView)
    func initialController(controller: RegistrationViewController)
    func initialWelcomeView(view: WelcomeView)
}

final class RegistrationAssembly: RegistrationAssemblyProtocol {

    func initialView(view: RegistrationContentView) {
        let presenter = RegistrationPresenter(view)
        let interactor = RegistrationInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: RegistrationViewController) {
        let presenter = RegistrationPresenter(controller)
        let interactor = RegistrationInteractor(presenter)
        let router = RegistrationRouter(controller)

        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

    }

    func initialWelcomeView(view: WelcomeView) {
        let presenter = RegistrationPresenter(view)
        let interactor = RegistrationInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor
    }
}
