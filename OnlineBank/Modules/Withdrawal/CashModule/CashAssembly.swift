//
//  CashAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import Foundation

protocol CashAssemblyProtocol: AnyObject {
    func initialView(view: CashContentView)
    func initialController(controller: CashViewController)
}

final class CashAssembly: CashAssemblyProtocol {

    func initialView(view: CashContentView) {
        let presenter = CashPresenter(view)
        let interactor = CashInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: CashViewController) {
        let presenter = CashPresenter(controller)
        let interactor = CashInteractor(presenter)
        let router = CashRouter(controller)

        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

    }
}
