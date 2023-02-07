//
//  TopUpPhoneNumderAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol TopUpPhoneNumderAssemblyProtocol: AnyObject {
    func initialView(view: TopUpPhoneNumderContentView)
    func initialController(controller: TopUpPhoneNumderViewController)
}

final class TopUpPhoneNumderAssembly: TopUpPhoneNumderAssemblyProtocol {

    func initialView(view: TopUpPhoneNumderContentView) {
        let presenter = TopUpPhoneNumderPresenter(view)
        let interactor = TopUpPhoneNumderInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: TopUpPhoneNumderViewController) {
        let presenter = TopUpPhoneNumderPresenter(controller)
        let interactor = TopUpPhoneNumderInteractor(presenter)
        let router = TopUpPhoneNumderRouter(controller)

        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

    }
}
