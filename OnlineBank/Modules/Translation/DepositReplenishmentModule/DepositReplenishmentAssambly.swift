//
//  DepositReplenishmentAssambly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol DepositReplenishmentAssamblyProtocol: AnyObject {
    func initialView(view: DepositReplenishmentContentView)
    func initialController(controller: DepositReplenishmentViewController)
}

final class DepositReplenishmentAssambly: DepositReplenishmentAssamblyProtocol {

    func initialView(view: DepositReplenishmentContentView) {
        let presenter = DepositReplenishmentPresenter(view)
        let interactor = DepositReplenishmentInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: DepositReplenishmentViewController) {
        let presenter = DepositReplenishmentPresenter(controller)
        let router = DepositReplenishmentRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
