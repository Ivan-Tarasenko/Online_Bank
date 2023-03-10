//
//  WithdrawalAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol WithdrawalAssemblyProtocol: AnyObject {
    func initialView(view: WithdrawalContentView)
    func initialController(controller: WithdrawalViewController)
}

final class WithdrawalAssembly: WithdrawalAssemblyProtocol {

    func initialView(view: WithdrawalContentView) {
        let presenter = WithdrawalPresenter(view)
        let interactor = WithdrawalInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: WithdrawalViewController) {
        let presenter = WithdrawalPresenter(controller)
        let router = WithdrawalRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
