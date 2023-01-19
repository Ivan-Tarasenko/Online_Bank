//
//  CashAssambly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import Foundation

protocol CashAssamblyProtocol: AnyObject {
    func initialView(view: CashContentView)
    func initialController(controller: CashViewController)
}

final class CashAssambly: CashAssamblyProtocol {

    func initialView(view: CashContentView) {
        let presenter = CashPresenter(view)
        let interactor = CashInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: CashViewController) {
        let presenter = CashPresenter(controller)
        let router = CashRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
