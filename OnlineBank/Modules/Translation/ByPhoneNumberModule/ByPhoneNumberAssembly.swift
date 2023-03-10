//
//  ByPhoneNumberAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol ByPhoneNumberAssemblyProtocol: AnyObject {
    func initialView(view: ByPhoneNumberContentView)
    func initialController(controller: ByPhoneNumberViewController)
}

final class ByPhoneNumberAssembly: ByPhoneNumberAssemblyProtocol {

    func initialView(view: ByPhoneNumberContentView) {
        let presenter = ByPhoneNumberPresenter(view)
        let interactor = ByPhoneNumberInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: ByPhoneNumberViewController) {
        let presenter = ByPhoneNumberPresenter(controller)
        let router = ByPhoneNumberRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
